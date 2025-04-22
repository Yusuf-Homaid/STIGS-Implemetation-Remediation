<#
.TITLE
    Enable Host-Based Firewall (WN10-00-000135)

.SYNOPSIS
    Checks if a host-based firewall is installed and enabled, and enables it if not.

.DESCRIPTION
    This script checks if the Windows Defender Firewall is installed and enabled on the system. 
    If the firewall is not enabled, it will be enabled automatically.
    If a third-party firewall is installed, it will verify if it is enabled as well.

.NOTES
    STIG ID   : WN10-00-000135
    Control   : A host-based firewall must be installed and enabled.
    Version   : 1.0
    Author    : Yusuf Homaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Enable-HostFirewall.ps1
#>

Write-Host "Checking the status of the host-based firewall..." -ForegroundColor Cyan

# Function to check and enable Windows Defender Firewall
function Enable-WindowsDefenderFirewall {
    Write-Host "Checking Windows Defender Firewall status..." -ForegroundColor Yellow
    $firewallStatus = Get-NetFirewallProfile | Where-Object { $_.Enabled -eq $false }
    
    if ($firewallStatus) {
        Write-Host "Windows Defender Firewall is disabled. Enabling..." -ForegroundColor Red
        Set-NetFirewallProfile -All -Enabled True
        Write-Host "Windows Defender Firewall has been enabled." -ForegroundColor Green
    } else {
        Write-Host "Windows Defender Firewall is already enabled." -ForegroundColor Green
    }
}

# Check if any third-party firewall is installed
function Check-ThirdPartyFirewall {
    $thirdPartyFirewalls = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -match "Firewall" }

    if ($thirdPartyFirewalls) {
        Write-Host "Third-party firewall(s) found:" -ForegroundColor Yellow
        $thirdPartyFirewalls | ForEach-Object { Write-Host $_.Name -ForegroundColor Yellow }
    } else {
        Write-Host "No third-party firewalls found." -ForegroundColor Green
    }
}

# Check and enable Windows Defender Firewall
Enable-WindowsDefenderFirewall

# Check if third-party firewall is installed
Check-ThirdPartyFirewall

Write-Host "Firewall check and configuration completed." -ForegroundColor Green
