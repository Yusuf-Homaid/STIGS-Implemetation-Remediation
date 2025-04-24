<#
.SYNOPSIS
    Ensures that the system is running in UEFI mode, not Legacy BIOS mode.

.DESCRIPTION
    This script:
    - Checks if the system is booted in UEFI mode.
    - Helps ensure compliance with STIG ID: WN10-00-000015.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000015

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Check if the system is booted in UEFI mode
$bootMode = Get-WmiObject -Class Win32_ComputerSystem

if ($bootMode.BootMode -eq "UEFI") {
    Write-Output "System is booted in UEFI mode."
} else {
    Write-Output "System is not booted in UEFI mode. Please configure the system to boot in UEFI mode in the firmware (BIOS/UEFI)."
    Write-Output "Ensure UEFI firmware is enabled and Legacy BIOS mode is disabled."
}
