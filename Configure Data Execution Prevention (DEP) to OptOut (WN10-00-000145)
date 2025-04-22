<#
.TITLE
    Configure Data Execution Prevention (DEP) to OptOut (WN10-00-000145)

.SYNOPSIS
    Checks if DEP is configured to at least "OptOut" and configures it if necessary.

.DESCRIPTION
    This script checks the current DEP configuration on the system using BCDEdit and sets it to "OptOut" if it is not already configured.
    The script ensures that DEP is enabled with the correct setting as per the STIG requirement.

.NOTES
    STIG ID   : WN10-00-000145
    Control   : DEP must be configured to at least OptOut.
    Version   : 1.0
    Author    : Yusuf Homaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.EXAMPLE
    .\Configure-DEP.ps1
#>

Write-Host "Checking Data Execution Prevention (DEP) configuration..." -ForegroundColor Cyan

# Get the current DEP configuration
$depConfig = bcdedit /enum {current} | Select-String -Pattern "nx" 

# Check if the current configuration is "OptOut" or "AlwaysOn"
if ($depConfig -match "nx\s*OptOut") {
    Write-Host "DEP is already configured to OptOut." -ForegroundColor Green
} elseif ($depConfig -match "nx\s*AlwaysOn") {
    Write-Host "DEP is configured to AlwaysOn, which is valid as well." -ForegroundColor Green
} else {
    Write-Host "DEP is not configured to OptOut or AlwaysOn. Configuring to OptOut..." -ForegroundColor Red
    # Configure DEP to OptOut
    bcdedit /set {current} nx OptOut
    Write-Host "DEP has been successfully configured to OptOut." -ForegroundColor Green
}

Write-Host "Please note: BitLocker should be suspended before making changes to DEP." -ForegroundColor Yellow
Write-Host "DEP configuration check and modification completed." -ForegroundColor Green
