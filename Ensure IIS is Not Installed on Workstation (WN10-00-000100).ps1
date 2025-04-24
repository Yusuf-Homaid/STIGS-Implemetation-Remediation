<#
.SYNOPSIS
    Ensures STIG compliance by verifying that IIS is not installed on the workstation.

.DESCRIPTION
    This script:
    - Checks if IIS or its subcomponents are installed.
    - Uninstalls IIS if present.
    - Ensures compliance with STIG ID: WN10-00-000100.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000100

.USAGE
    1. Open PowerShell as Administrator.
    2. Run this script to check and uninstall IIS if necessary.
#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell as Administrator!" -ErrorAction Stop
}

# Check if IIS or its subcomponents are installed
$features = Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -like "IIS*" }

if ($features) {
    # Uninstall IIS and its subcomponents
    foreach ($feature in $features) {
        Disable-WindowsOptionalFeature -Online -FeatureName $feature.FeatureName -Remove -NoRestart
        Write-Output "Uninstalled: $($feature.FeatureName)"
    }
} else {
    Write-Output "No IIS components found. System is compliant."
}
