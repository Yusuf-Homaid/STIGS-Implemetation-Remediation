<#

.SYNOPSIS
    Ensures that standard local user accounts do not exist on a domain-joined system (WN10-00-000085).

.DESCRIPTION
    This script checks for the presence of unauthorized local user accounts on a domain-joined Windows 10 system. Only default built-in accounts and local administrator accounts should be present. If unauthorized accounts exist, they will be flagged for review.

.NOTES
    STIG ID   : WN10-00-000085
    Control   : Limit local user accounts on domain-joined systems
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Check-LocalUsersOnDomain.ps1
#>

# Skip execution if not domain-joined
$domainRole = (Get-WmiObject Win32_ComputerSystem).DomainRole
if ($domainRole -eq 0 -or $domainRole -eq 1) {
    Write-Host "This system is not domain-joined. This check is not applicable." -ForegroundColor Cyan
    return
}

# Allowed local accounts
$allowedAccounts = @(
    "Administrator",
    "Guest",
    "DefaultAccount",
    "defaultuser0",
    "WDAGUtilityAccount"
)

Write-Host "Checking for unauthorized local accounts..." -ForegroundColor Cyan

# Get all local user accounts
$localUsers = Get-LocalUser

foreach ($user in $localUsers) {
    if ($allowedAccounts -notcontains $user.Name -and $user.Name -notlike "*admin*") {
        Write-Warning "Unauthorized local account found: $($user.Name)"
    }
}

Write-Host "Review complete. Ensure unauthorized local accounts are removed." -ForegroundColor Green
