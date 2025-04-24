<#
.SYNOPSIS
    Implements STIG: WN10-00-000220 - Windows Defender must check for the latest virus and spyware definitions before scans.
.DESCRIPTION
    Ensures Windows Defender Antivirus updates definitions prior to scanning by setting the required registry value.
.NOTES
    STIG ID   : WN10-00-000220
    Version   : 1.0
    Author    : Yusuf Homaid
    Date      : 2025-04-24
#>

$RegPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan'
$Name = 'CheckForSignaturesBeforeRunningScan'
$ExpectedValue = 1

try {
    if (-not (Test-Path $RegPath)) {
        Write-Host "[INFO] Registry path not found. Creating: $RegPath" -ForegroundColor Yellow
        New-Item -Path $RegPath -Force | Out-Null
    }

    $current = Get-ItemProperty -Path $RegPath -Name $Name -ErrorAction SilentlyContinue

    if ($null -eq $current) {
        Write-Host "[FIX] Setting '$Name' to $ExpectedValue" -ForegroundColor Cyan
        New-ItemProperty -Path $RegPath -Name $Name -Value $ExpectedValue -PropertyType DWord -Force | Out-Null
    }
    elseif ($current.$Name -ne $ExpectedValue) {
        Write-Host "[FIX] '$Name' is $($current.$Name). Updating to $ExpectedValue" -ForegroundColor Cyan
        Set-ItemProperty -Path $RegPath -Name $Name -Value $ExpectedValue
    }
    else {
        Write-Host "[OK] '$Name' is correctly set to $ExpectedValue" -ForegroundColor Green
    }
}
catch {
    Write-Host "[ERROR] Failed to configure $Name: $_" -ForegroundColor Red
}
