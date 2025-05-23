<#
.SYNOPSIS
    Ensures STIG compliance by configuring the account lockout duration.

.DESCRIPTION
    This script:
    - Configures the account lockout duration to 15 minutes.
    - Ensures that after a lockout, user accounts remain locked for a fixed time.
    - Complies with STIG ID: WN10-AC-000005.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-AC-000005

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Define the account lockout duration
$lockoutDuration = 15
$cfgPath = "$env:TEMP\secpol_lockout.cfg"

# Export current local security policy settings
secedit /export /cfg $cfgPath

# Replace or insert LockoutDuration setting
$content = Get-Content $cfgPath
if ($content -match "LockoutDuration") {
    $content = $content -replace "LockoutDuration\s*=\s*\d+", "LockoutDuration = $lockoutDuration"
} else {
    $content += "`nLockoutDuration = $lockoutDuration"
}
$content | Set-Content $cfgPath

# Apply the updated security policy settings
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg $cfgPath /areas SECURITYPOLICY

# Cleanup
Remove-Item $cfgPath -Force

Write-Output "STIG Fix Applied: Account lockout duration set to $lockoutDuration minutes."
