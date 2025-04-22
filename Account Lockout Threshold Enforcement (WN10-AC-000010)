<#
.SYNOPSIS
    Ensures STIG compliance by configuring account lockout threshold.

.DESCRIPTION
    This script:
    - Configures the system to lock user accounts after 5 invalid logon attempts.
    - Helps prevent brute-force password attacks.
    - Ensures compliance with STIG ID: WN10-AC-000010.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-AC-000010

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Define security settings
$cfgPath = "$env:TEMP\secpol.cfg"
$threshold = 5

# Export current security settings
secedit /export /cfg $cfgPath

# Update account lockout threshold
(Get-Content $cfgPath).replace("LockoutBadCount = 0", "LockoutBadCount = $threshold") | Set-Content $cfgPath

# Apply changes
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg $cfgPath /areas SECURITYPOLICY

# Clean up
Remove-Item $cfgPath -Force

Write-Output "STIG Fix Applied: Account lockout threshold set to $threshold invalid attempts."
