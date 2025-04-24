<#
.TITLE
    Ensure Supported Windows 10 Servicing Level (WN10-00-000040)

.SYNOPSIS
    Ensure Supported Windows 10 Servicing Level (WN10-00-000040)

.DESCRIPTION
    This script verifies that the system is maintained at a supported servicing level for Windows 10,
    in accordance with DISA STIG requirement WN10-00-000040.

    Systems on unsupported servicing levels do not receive critical security updates and are
    vulnerable to exploitation. The minimum recommended build for compliance is Build 19044 (21H2)
    or higher (e.g., 22H2 Build 19045).

.NOTES
    STIG ID   : WN10-00-000040
    Control   : Ensure Supported Windows 10 Servicing Level
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip
    https://learn.microsoft.com/en-us/windows/release-health/release-information

.EXAMPLE
    .\Ensure-SupportedWin10Build.ps1
#>

# Define minimum supported build number (e.g., 19044 = 21H2, 19045 = 22H2)
$minSupportedBuild = 19044

# Retrieve OS details
$os = Get-CimInstance Win32_OperatingSystem
$currentBuild = [int]$os.BuildNumber
$versionString = $os.Version
$caption = $os.Caption

Write-Host "`n[+] System OS: $caption" -ForegroundColor Cyan
Write-Host "[+] OS Version: $versionString (Build $currentBuild)`n" -ForegroundColor Cyan

# Compliance Check
if ($currentBuild -ge $minSupportedBuild) {
    Write-Host "[COMPLIANT] System is running a supported Windows 10 build ($currentBuild ≥ $minSupportedBuild)." -ForegroundColor Green
} else {
    Write-Warning "[NON-COMPLIANT] System is running an unsupported Windows 10 build!"
    Write-Host "→ Please upgrade to at least 21H2 (Build 19044) or later (22H2 recommended)." -ForegroundColor Yellow
    Write-Host "→ Navigate to: Settings > Update & Security > Windows Update" -ForegroundColor Magenta
}

# Optional: Uncomment to open Windows Update directly
# Start-Process "ms-settings:windowsupdate"
