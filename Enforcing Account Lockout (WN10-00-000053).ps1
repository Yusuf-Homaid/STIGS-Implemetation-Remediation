<#
.SYNOPSIS
    Ensures STIG compliance by enforcing account lockout after failed login attempts.

.DESCRIPTION
    This script:
    - Configures account lockout settings to lock the account after a defined number of failed login attempts.
    - Ensures compliance with STIG ID: WN10-00-000053.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000053

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.

#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Define account lockout settings
$lockoutThreshold = 5
$lockoutDuration = 15 # minutes
$resetTime = 15 # minutes

# Configure account lockout policy
secpol.msc /set "LockoutBadCount" $lockoutThreshold
secpol.msc /set "LockoutDuration" $lockoutDuration
secpol.msc /set "ResetLockoutCount" $resetTime

Write-Output "STIG Fix Applied: Account lockout after $lockoutThreshold failed login attempts is now enforced."
