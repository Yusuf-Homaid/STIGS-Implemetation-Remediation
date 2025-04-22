<#
.SYNOPSIS
    Enables BitLocker encryption on the system drive (C:) to protect data at rest.

.DESCRIPTION
    This script:
    - Ensures compliance with STIG ID: WN10-00-000030 by enabling full disk encryption using BitLocker.
    - Protects the confidentiality and integrity of information at rest.

.NOTES
    Author          : Yusuf Homaid
    LinkedIn        : https://www.linkedin.com/in/yusuf-homaid/
    GitHub          : https://github.com/Yusuf-Homaid
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    STIG-ID         : WN10-00-000030

.USAGE
    1. Open PowerShell ISE as Administrator.
    2. Load and run this script.
#>

# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run PowerShell as Administrator!" -ErrorAction Stop
}

# Enable BitLocker on the C: drive
$drive = "C:"
$bitlockerStatus = Get-BitLockerVolume -MountPoint $drive

if ($bitlockerStatus.ProtectionStatus -eq 'Off') {
    Write-Output "BitLocker is not enabled. Enabling BitLocker on drive $drive..."
    Enable-BitLocker -MountPoint $drive -EncryptionMethod Aes256 -UsedSpaceOnly
    Write-Output "BitLocker encryption has been enabled on drive $drive."
} else {
    Write-Output "BitLocker is already enabled on drive $drive."
}

# Verify BitLocker status
$bitlockerStatus = Get-BitLockerVolume -MountPoint $drive
Write-Output "BitLocker Encryption Status: $($bitlockerStatus.ProtectionStatus)"
