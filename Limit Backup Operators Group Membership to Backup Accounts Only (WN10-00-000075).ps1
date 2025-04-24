<#
.TITLE
    Limit Backup Operators Group Membership to Backup Accounts Only (WN10-00-000075)

.SYNOPSIS
    Ensures only accounts designated for backup operations are members of the Backup Operators group (WN10-00-000075).

.DESCRIPTION
    The Backup Operators group has elevated privileges that allow circumvention of NTFS file access controls. To maintain proper security, only dedicated backup accounts should be part of this group. This script lists members of the group and identifies any non-compliant accounts.

.NOTES
    STIG ID   : WN10-00-000075
    Control   : Limit Backup Operators Group Membership
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Check-BackupOperatorsGroup.ps1
#>

# Get Backup Operators group members
$groupName = "Backup Operators"
$group = [ADSI]"WinNT://$env:COMPUTERNAME/$groupName,group"

Write-Host "Checking members of '$groupName' group..." -ForegroundColor Cyan

$group.Members() | ForEach-Object {
    $member = $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)
    Write-Host "  Member found: $member" -ForegroundColor Yellow

    # Optional: You can flag any member that does not match a pattern you expect for backup accounts
    if ($member -notmatch "backup|svc|bkp") {
        Write-Warning "  --> '$member' may not be a designated backup account. Review required."
    }
}

Write-Host "Review complete. Only backup-specific accounts should be part of the '$groupName' group." -ForegroundColor Green
