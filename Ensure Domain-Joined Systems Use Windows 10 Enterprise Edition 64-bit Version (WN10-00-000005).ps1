<#
.SYNOPSIS
    Checks if the system is running Windows 10 Enterprise Edition 64-bit version.

.DESCRIPTION
    This script:
    - Verifies if the system is running Windows 10 Enterprise Edition.
    - Checks if the architecture is 64-bit.
    - Ensures compliance with STIG ID: WN10-00-000005.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000005

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Get the OS Edition and Architecture
$osEdition = (Get-WmiObject -Class Win32_OperatingSystem).Caption
$architecture = (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture

# Check if the system is running Windows 10 Enterprise 64-bit
if ($osEdition -like "*Enterprise*" -and $architecture -eq "64-bit") {
    Write-Output "The system is compliant with STIG WN10-00-000005: Windows 10 Enterprise 64-bit edition."
} else {
    Write-Output "The system is NOT compliant with STIG WN10-00-000005."
    Write-Output "Please ensure the system is running Windows 10 Enterprise 64-bit edition."
}
