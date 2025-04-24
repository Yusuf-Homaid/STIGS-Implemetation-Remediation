<#
.TITLE
    Limit Access to Non-System-Created File Shares (WN10-00-000060)

.SYNOPSIS
    Ensure non-system-created file shares limit access to groups that require it (WN10-00-000060).

.DESCRIPTION
    This script identifies non-system-created file shares on a Windows system. If such shares exist, the script checks if the share and NTFS permissions have been configured to limit access to the specific groups or accounts that need it. Any unnecessary or misconfigured shares are flagged for review and remediation.

.NOTES
    STIG ID   : WN10-00-000060
    Control   : Limit Access to Non-System-Created File Shares
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Limit-FileShareAccess.ps1
#>

# Get all shares on the system
$shares = Get-WmiObject -Class Win32_Share

# System-created shares to exclude
$systemShares = @('ADMIN$', 'C$', 'IPC$')

foreach ($share in $shares) {
    if ($systemShares -contains $share.Name) {
        continue
    }

    Write-Host "[NON-SYSTEM SHARE] Share: $($share.Name)"

    # Check Share Permissions
    $sharePermissions = Get-WmiObject -Class Win32_LogicalShareSecuritySetting -Filter "Name = '$($share.Name)'"
    $sharePermissions | ForEach-Object {
        $shareSecurity = $_.GetSecurityDescriptor()
        $sharePermissionsList = $shareSecurity.DACL | Where-Object { $_.AccessMask -eq '0x0' } # Modify as needed
        if ($sharePermissionsList.Count -gt 0) {
            Write-Warning "Permissions not configured to restrict access to specific groups or accounts for share: $($share.Name)"
        }
    }

    # Check NTFS Permissions
    $ntfsPermissions = Get-Acl -Path "\\$env:COMPUTERNAME\$($share.Name)"
    $ntfsPermissions.Access | ForEach-Object {
        if ($_.AccessControlType -eq 'Allow' -and $_.IdentityReference -notmatch 'Administrators|System') {
            Write-Warning "NTFS permissions for share $($share.Name) are not restricted to required accounts or groups."
        }
    }
}

Write-Host "Please review non-system shares and configure permissions as necessary." -ForegroundColor Yellow
