<#
.TITLE
    Disable or Remove Inactive Accounts After 35 Days of Inactivity (WN10-00-000065)

.SYNOPSIS
    Ensure that unused local accounts are disabled or removed after 35 days of inactivity (WN10-00-000065).

.DESCRIPTION
    This script identifies local user accounts that have not logged in for the past 35 days. Any active accounts that have been inactive for this period will be flagged for review, and if necessary, they should be disabled or removed. 
    Accounts that are built-in (such as Administrator, Guest, DefaultAccount) or explicitly required by the organization should be excluded from this check.

    This check helps mitigate the risk of unauthorized access via stale or unused accounts.

.NOTES
    STIG ID   : WN10-00-000065
    Control   : Disable or Remove Inactive Accounts After 35 Days of Inactivity
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Disable-InactiveAccounts.ps1
#>

# Get a list of local user accounts
$inactiveThreshold = (Get-Date).AddDays(-35)
$accounts = ([ADSI]("WinNT://$env:COMPUTERNAME")).Children | Where-Object { $_.SchemaClassName -eq 'user' }

foreach ($account in $accounts) {
    $user = ([ADSI]$account.Path)
    $lastLogin = $user.Properties.LastLogin.Value
    $enabled = ($user.Properties.UserFlags.Value -band 0x2) -ne 0x2

    # Skip built-in accounts and local administrator account
    if ($user.Name -match 'Administrator|Guest|DefaultAccount') {
        continue
    }

    if ($lastLogin -eq $null) {
        $lastLogin = 'Never'
    }

    # If account is enabled and inactive for more than 35 days, flag it
    if ($enabled -and ($lastLogin -eq 'Never' -or $lastLogin -lt $inactiveThreshold)) {
        Write-Warning "[INACTIVE ACCOUNT] Account: $($user.Name) Last Login: $lastLogin | Status: Enabled"
    } else {
        Write-Host "[ACTIVE ACCOUNT] Account: $($user.Name) Last Login: $lastLogin | Status: Enabled"
    }
}

Write-Host "Please review the inactive accounts and disable or remove as necessary." -ForegroundColor Yellow
