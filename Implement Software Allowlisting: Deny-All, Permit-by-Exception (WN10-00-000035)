<#
.SYNOPSIS
    Implements AppLocker policy to enforce a deny-all, permit-by-exception software execution model as required by STIG WN10-00-000035.

.DESCRIPTION
    This script configures default allowlisting rules using AppLocker on Windows 10 Enterprise or Education systems. 
    It enforces a security baseline that only allows trusted and authorized applications to execute, mitigating the risk of unauthorized software.

    This script:
    - Enables and starts the Application Identity service.
    - Generates and applies default rules for executables, scripts, installers, DLLs, and packaged apps.
    - Exports the policy for auditing purposes.

.NOTES
    STIG ID   : WN10-00-000035
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Required  : Run as Administrator
    Tested on : Windows 10 Enterprise 22H2

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip
    https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/applocker-policies-deployment-guide

.EXAMPLE
    .\Enable-AppLocker-Allowlist.ps1
#>

# Ensure script is run with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole('Administrator')) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

Write-Host "`n[+] Starting AppLocker configuration..." -ForegroundColor Cyan

# Enable and start Application Identity service (required for AppLocker)
Write-Host "[*] Enabling and starting AppIDSvc..." -ForegroundColor Yellow
Set-Service -Name AppIDSvc -StartupType Automatic -ErrorAction Stop
Start-Service -Name AppIDSvc

# Define rule types
$ruleTypes = @("Exe", "Msi", "Script", "Dll", "Appx")

# Create default rules
Write-Host "[*] Generating default AppLocker rules..." -ForegroundColor Yellow
foreach ($type in $ruleTypes) {
    try {
        New-AppLockerPolicy -DefaultRule -RuleType $type | Out-Null
    } catch {
        Write-Warning "Failed to create default rule for type: $type"
    }
}

# Export policy for review
$policyPath = "$env:ProgramData\AppLockerPolicy-WN10-00-000035.xml"
Write-Host "[*] Exporting policy to $policyPath" -ForegroundColor Yellow
$policy = New-AppLockerPolicy -Local -RuleType $ruleTypes -User "Everyone"
$policy | Export-AppLockerPolicy -Path $policyPath -ErrorAction Stop

# Apply policy to the system
Write-Host "[*] Applying AppLocker policy..." -ForegroundColor Yellow
Import-AppLockerPolicy -Path $policyPath -Merge -ErrorAction Stop

Write-Host "`n[+] AppLocker policy successfully applied. Please restart the system to enforce application restrictions." -ForegroundColor Green
