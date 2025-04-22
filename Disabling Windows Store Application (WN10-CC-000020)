<#
.SYNOPSIS
    Ensures STIG compliance by disabling the Windows Store application.

.DESCRIPTION
    This script:
    - Disables the Microsoft Windows Store to prevent unauthorized application installations.
    - Ensures compliance with STIG ID: WN10-CC-000020.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-CC-000020

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.

#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Registry path to disable Windows Store
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"
$name = "RemoveWindowsStore"
$value = 1

# Create registry path if missing
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Apply registry setting
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord -Force

Write-Output "STIG Fix Applied: Windows Store has been disabled."
