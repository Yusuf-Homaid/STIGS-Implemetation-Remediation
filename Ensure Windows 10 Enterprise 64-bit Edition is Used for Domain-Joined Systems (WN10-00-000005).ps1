<#
.TITLE
    Ensure Windows 10 Enterprise 64-bit Edition is Used for Domain-Joined Systems (WN10-00-000005)

.SYNOPSIS
    Ensure Windows 10 Enterprise 64-bit Edition is Used for Domain-Joined Systems (WN10-00-000005)

.DESCRIPTION
    This script verifies that domain-joined systems are running the Windows 10 Enterprise 64-bit edition.
    This configuration is essential for enabling features such as Credential Guard, which uses virtualization-based security to protect against credential theft attacks.

    Systems that are not using Windows 10 Enterprise 64-bit may not be able to leverage these important security features.

.NOTES
    STIG ID   : WN10-00-000005
    Control   : Ensure Windows 10 Enterprise 64-bit Edition is Used for Domain-Joined Systems
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Ensure-Enterprise64BitEdition.ps1
#>

# Get the operating system edition and system architecture
$osEdition = (Get-CimInstance -ClassName Win32_OperatingSystem).ProductType
$systemArchitecture = (Get-CimInstance -ClassName Win32_OperatingSystem).OSArchitecture

if ($osEdition -eq 'Enterprise' -and $systemArchitecture -eq '64-bit') {
    Write-Host "[COMPLIANT] The system is running Windows 10 Enterprise 64-bit." -ForegroundColor Green
} else {
    Write-Warning "[NON-COMPLIANT] The system is not using Windows 10 Enterprise 64-bit."
    Write-Host "→ Please ensure that your system is domain-joined and running Windows 10 Enterprise 64-bit edition." -ForegroundColor Yellow
    Write-Host "→ If necessary, upgrade your system to the appropriate edition for the features to be available." -ForegroundColor Magenta
}
