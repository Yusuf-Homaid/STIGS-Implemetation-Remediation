<#
.SYNOPSIS
    Ensures STIG compliance by enforcing a minimum password length.

.DESCRIPTION
    This script:
    - Configures local security policy to require passwords to be at least 14 characters long.
    - Ensures compliance with STIG ID: WN10-00-000075.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000075

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Define the minimum password length
$MinPasswordLength = 14

# Export current security settings
$cfgPath = "$env:TEMP\secpol.cfg"
secedit /export /cfg $cfgPath

# Update password length setting
(Get-Content $cfgPath).replace("MinimumPasswordLength = 0", "MinimumPasswordLength = $MinPasswordLength") | Set-Content $cfgPath

# Apply updated settings
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg $cfgPath /areas SECURITYPOLICY

# Clean up
Remove-Item $cfgPath -Force

Write-Output "STIG Fix Applied: Minimum password length set to $MinPasswordLength characters."
