<#
.SYNOPSIS
    Ensures STIG compliance by setting the account lockout observation window.

.DESCRIPTION
    This script:
    - Configures the time window (in minutes) for counting invalid logon attempts.
    - Helps ensure brute-force attempts are tracked within a 15-minute window.
    - Complies with STIG ID: WN10-00-000105.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000105

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Define observation window in minutes
$observationWindow = 15
$cfgPath = "$env:TEMP\secpol_window.cfg"

# Export current local security policy settings
secedit /export /cfg $cfgPath

# Replace or insert LockoutObservationWindow setting
$content = Get-Content $cfgPath
if ($content -match "ResetLockoutCount") {
    $content = $content -replace "ResetLockoutCount\s*=\s*\d+", "ResetLockoutCount = $observationWindow"
} else {
    $content += "`nResetLockoutCount = $observationWindow"
}
$content | Set-Content $cfgPath

# Apply the updated security policy settings
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg $cfgPath /areas SECURITYPOLICY

# Cleanup
Remove-Item $cfgPath -Force

Write-Output "STIG Fix Applied: Account lockout observation window set to $observationWindow minutes."
