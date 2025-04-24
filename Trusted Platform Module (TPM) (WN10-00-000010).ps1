<#
.SYNOPSIS
    Ensures that TPM is enabled and ready for use on Windows 10 domain-joined systems.

.DESCRIPTION
    This script:
    - Checks if the Trusted Platform Module (TPM) is enabled and ready for use.
    - Helps ensure compliance with STIG ID: WN10-00-000010.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000010

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Check if TPM is available and enabled
$tpm = Get-WmiObject -Class Win32_Tpm

if ($tpm) {
    if ($tpm.TpmPresent -eq $true -and $tpm.IsActivated_InitialValue -eq $true) {
        Write-Output "TPM is enabled and ready for use."
    } else {
        Write-Output "TPM is either not enabled or not ready for use. Please enable TPM in the firmware (UEFI/BIOS)."
        Write-Output "You can check the TPM configuration options by running 'tpm.msc' in the Run dialog."
    }
} else {
    Write-Output "No TPM module found on this system. Ensure the system has a TPM chip installed and enabled in the firmware."
}
