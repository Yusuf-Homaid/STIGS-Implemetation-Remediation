<#
.SYNOPSIS
    Enforces a minimum password length on Windows systems to ensure compliance with CCI-000205.

.DESCRIPTION
    This script:
    - Ensures compliance with Control Correlation Identifier (CCI) CCI-000205 by setting a minimum password length policy.
    - Enforces a minimum password length requirement of 14 characters for all local user accounts.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CCI-ID          : CCI-000205

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
    3. Verify that the minimum password length has been successfully set.

#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell as Administrator!" -ErrorAction Stop
}

# Define the minimum password length required (14 characters as per CCI-000205)
$minimumPasswordLength = 14

# Retrieve current password policy
$passwordPolicy = Get-LocalUser | Get-LocalUserProperty

# Enforce the minimum password length policy
$gpeditCmd = "secpol.msc"
Invoke-Expression -Command $gpeditCmd

# Setting minimum password length to 14 characters
$PasswordPolicy = Set-LocalGroupPolicy -Name "MinimumPasswordLength" -Value $minimumPasswordLength

# Verify the change
$currentPasswordLength = Get-LocalGroupPolicy -Name "MinimumPasswordLength"
if ($currentPasswordLength -eq $minimumPasswordLength) {
    Write-Output "Password length policy successfully enforced. Minimum password length is now set to $minimumPasswordLength characters." -ForegroundColor Green
} else {
    Write-Output "Failed to enforce password length policy." -ForegroundColor Red
}
