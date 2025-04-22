<#
.SYNOPSIS
    Checks the status of Secure Boot on a Windows 10 system.

.DESCRIPTION
    This script:
    - Retrieves the Secure Boot status.
    - If Secure Boot is disabled, provides instructions to enable it via UEFI/BIOS.
    - Helps ensure STIG compliance with WN10-00-000020.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000020

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Check if Secure Boot is enabled using the System Information tool
$secureBootStatus = Get-WmiObject -Class Win32_BootConfiguration | Select-Object -ExpandProperty SecureBoot

# Determine the result
if ($secureBootStatus -eq "True") {
    Write-Output "Secure Boot is enabled on this system. No action is needed for STIG compliance."
} else {
    Write-Output "Secure Boot is disabled on this system."
    Write-Output "To enable Secure Boot, follow these steps:"
    Write-Output "1. Restart the system."
    Write-Output "2. Enter the UEFI/BIOS settings (usually by pressing a key like F2, F12, or Del during boot)."
    Write-Output "3. Locate the Secure Boot option and enable it."
    Write-Output "4. Save the changes and exit the UEFI/BIOS settings."
    Write-Output "5. Reboot the system."
}
