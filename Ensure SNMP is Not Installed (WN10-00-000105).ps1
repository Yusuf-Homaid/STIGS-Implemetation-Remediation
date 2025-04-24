<#
.TITLE
    Ensure SNMP is Not Installed (WN10-00-000105)

.SYNOPSIS
    Detects the presence of the Simple Network Management Protocol (SNMP) and provides a finding if it is installed.

.DESCRIPTION
    SNMP lacks modern security controls and should not be present on Windows 10 systems. This script checks if SNMP is installed by inspecting Windows Features.

.NOTES
    STIG ID   : WN10-00-000105
    Control   : SNMP must not be installed on the system
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Check-SNMPStatus.ps1
#>

Write-Host "Checking for SNMP installation..." -ForegroundColor Cyan

$snmpFeature = Get-WindowsOptionalFeature -Online -FeatureName "SNMP"

if ($snmpFeature.State -eq "Enabled") {
    Write-Warning "SNMP is installed on this system. ❌"
    Write-Host "Remediation: Uninstall SNMP via 'Turn Windows features on or off' or use the following command:" -ForegroundColor Yellow
    Write-Host "    Disable-WindowsOptionalFeature -Online -FeatureName SNMP"
} else {
    Write-Host "SNMP is not installed. ✔️" -ForegroundColor Green
}
