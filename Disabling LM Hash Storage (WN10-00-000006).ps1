<#
.SYNOPSIS
    Ensures STIG compliance by disabling LM hash storage.

.DESCRIPTION
    This script:
    - Disables the storage of LM hashes, enhancing password security.
    - Ensures compliance with STIG ID: WN10-00-000006.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000006

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.

#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell ISE as Administrator!" -ErrorAction Stop
}

# Define registry path to disable LM hash storage
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

$settings = @{
    "NoLMHash" = 1
}

# Create or update registry path and set values
foreach ($name in $settings.Keys) {
    Set-ItemProperty -Path $registryPath -Name $name -Value $settings[$name] -Type DWord -Force
}

Write-Output "STIG Fix Applied: LM hash storage is now disabled."
