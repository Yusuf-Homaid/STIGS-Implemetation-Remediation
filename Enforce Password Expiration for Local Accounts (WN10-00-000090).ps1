<#
.TITLE
    Enforce Password Expiration for Local Accounts (WN10-00-000090)

.SYNOPSIS
    Ensures local user accounts are not configured with the "Password never expires" setting.

.DESCRIPTION
    This script checks all local user accounts and reports those with the "Password never expires" option enabled, which violates the STIG control requiring password expiration.

.NOTES
    STIG ID   : WN10-00-000090
    Control   : Accounts must be configured to require password expiration
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Check-PasswordExpiration.ps1
#>

Write-Host "Checking local accounts for 'Password never expires' setting..." -ForegroundColor Cyan

$nonCompliantUsers = @()

Get-LocalUser | ForEach-Object {
    if ($_.PasswordNeverExpires -eq $true -and $_.Enabled -eq $true) {
        Write-Warning "Account '$($_.Name)' has 'Password never expires' enabled."
        $nonCompliantUsers += $_.Name
    }
}

if ($nonCompliantUsers.Count -eq 0) {
    Write-Host "All enabled local accounts require password expiration. ✔️" -ForegroundColor Green
} else {
    Write-Host "`nAccounts requiring remediation:" -ForegroundColor Yellow
    $nonCompliantUsers | ForEach-Object { Write-Host "- $_" }
}
