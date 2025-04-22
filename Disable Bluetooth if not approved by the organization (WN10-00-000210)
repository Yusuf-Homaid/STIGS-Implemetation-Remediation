<#
.TITLE
    Disable Bluetooth if not approved by the organization (WN10-00-000210)

.SYNOPSIS
    Checks if Bluetooth is enabled and disables it if necessary, ensuring compliance with the security policy.

.DESCRIPTION
    This script checks if Bluetooth is enabled on a Windows 10 system and turns off Bluetooth radios if not approved by the organization.
    The script can be modified to include organizational approval policies.

.NOTES
    STIG ID   : WN10-00-000210
    Control   : Bluetooth must be turned off unless approved by the organization.
    Version   : 1.0
    Author    : Yusuf Homaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.EXAMPLE
    .\Disable-Bluetooth.ps1
#>

Write-Host "Checking Bluetooth configuration..." -ForegroundColor Cyan

# Get the status of Bluetooth using Get-PnpDevice to find Bluetooth devices
$bluetoothDevice = Get-PnpDevice | Where-Object { $_.Class -eq 'Bluetooth' }

# Check if Bluetooth is enabled
if ($bluetoothDevice -and $bluetoothDevice.Status -eq 'OK') {
    Write-Host "Bluetooth is enabled. Turning off Bluetooth..." -ForegroundColor Red
    
    # Disable Bluetooth device
    Disable-PnpDevice -InstanceId $bluetoothDevice.InstanceId -Confirm:$false
    Write-Host "Bluetooth has been successfully disabled." -ForegroundColor Green
} else {
    Write-Host "Bluetooth is already disabled or not present on this system." -ForegroundColor Green
}

Write-Host "Please ensure that organizational approval for Bluetooth use is documented." -ForegroundColor Yellow
Write-Host "Bluetooth configuration check completed." -ForegroundColor Green
