<#
.SYNOPSIS
    Enables BitLocker Pre-Boot Authentication with TPM + PIN on Windows 10.

.DESCRIPTION
    Applies Group Policy setting for requiring a PIN at startup.
    Initiates BitLocker drive encryption using TPM + PIN.

.NOTES
    Author          : Yusuf Homaid
    Date Created    : 2025-04-22
    STIG-ID         : WN10-00-000031
    Reference       : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip
#>

# Ensure Administrator rights
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrator")) {
    Write-Error "Run this script as Administrator!"
    exit
}

# Set the Group Policy setting using Registry (if GPO not enforced from domain)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name "UseAdvancedStartup" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath -Name "EnableBDEWithTPMPIN" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath -Name "UseTPM" -Value 2 -Type DWord  # 2 = Require TPM
Set-ItemProperty -Path $regPath -Name "UseTPMPIN" -Value 2 -Type DWord  # 2 = Require TPM + PIN

# Enable BitLocker with TPM + PIN
$SecureStringPIN = Read-Host "Enter BitLocker PIN (minimum 6 digits)" -AsSecureString
Enable-BitLocker -MountPoint "C:" -EncryptionMethod Aes256 -TpmProtector -Pin $SecureStringPIN

Write-Output "`nBitLocker with TPM + PIN has been configured. Reboot required to test pre-boot authentication."
