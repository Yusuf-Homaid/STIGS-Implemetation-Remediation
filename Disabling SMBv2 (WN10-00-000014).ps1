<#
.SYNOPSIS
    Ensures STIG compliance by disabling SMBv2.

.DESCRIPTION
    This script:
    - Disables the SMBv2 protocol to prevent potential vulnerabilities.
    - Ensures compliance with STIG ID: WN10-00-000014.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000014

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.

#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Disable SMBv2 protocol
Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force

Write-Output "STIG Fix Applied: SMBv2 protocol has been disabled."
