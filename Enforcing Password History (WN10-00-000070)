<#
.SYNOPSIS
    Ensures STIG compliance by enforcing password history.

.DESCRIPTION
    This script:
    - Configures the system to remember previous passwords and prevent reuse.
    - Ensures compliance with STIG ID: WN10-00-000070.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000070

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.

#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Enforce password history to remember the last 24 passwords
$PasswordHistoryCount = 24
secedit /export /cfg C:\Windows\Temp\secpol.cfg

(Get-Content C:\Windows\Temp\secpol.cfg).replace("PasswordHistorySize = 0", "PasswordHistorySize = $PasswordHistoryCount") | Set-Content C:\Windows\Temp\secpol.cfg

secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\Windows\Temp\secpol.cfg /areas SECURITYPOLICY

Remove-Item C:\Windows\Temp\secpol.cfg -Force

Write-Output "STIG Fix Applied: Password history now remembers the last $PasswordHistoryCount passwords."
