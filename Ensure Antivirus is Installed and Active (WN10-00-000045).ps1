<#
.TITLE
    Ensure Antivirus is Installed and Active (WN10-00-000045)

.SYNOPSIS
    Ensure Antivirus is Installed and Active (WN10-00-000045)

.DESCRIPTION
    This script verifies that an antivirus solution is installed and active on the Windows 10 system,
    in accordance with DISA STIG requirement WN10-00-000045.

    Antivirus software helps detect and prevent malware from compromising the operating system.
    The system must have either Microsoft Defender Antivirus or a third-party antivirus product installed and active.

.NOTES
    STIG ID   : WN10-00-000045
    Control   : Ensure Antivirus is Installed and Active
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip
    https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-antivirus-in-windows-10

.EXAMPLE
    .\Ensure-AntivirusInstalled.ps1
#>

# Check for antivirus product(s) registered with Windows Security Center
$avProducts = Get-CimInstance -Namespace "root/SecurityCenter2" -ClassName "AntiVirusProduct"

if ($avProducts) {
    Write-Host "`n[+] Antivirus Product(s) Detected:" -ForegroundColor Cyan
    foreach ($product in $avProducts) {
        Write-Host " - $($product.displayName)" -ForegroundColor Green
    }

    # Check if any of the antivirus products are enabled and up to date
    $activeProducts = $avProducts | Where-Object { $_.productState -match '^10|^11|^1[6-9]' }
    if ($activeProducts) {
        Write-Host "`n[COMPLIANT] An active antivirus solution is installed and enabled." -ForegroundColor Green
    } else {
        Write-Warning "[NON-COMPLIANT] Antivirus detected but not active or up to date."
    }
} else {
    Write-Warning "`n[NON-COMPLIANT] No antivirus product detected on this system!"
    Write-Host "→ Please install Microsoft Defender or a third-party antivirus solution immediately." -ForegroundColor Yellow
    Write-Host "→ Access Windows Security > Virus & Threat Protection to review antivirus status." -ForegroundColor Magenta
}
