<#
.TITLE
    Ensure Local Volumes are Formatted Using NTFS (WN10-00-000050)

.SYNOPSIS
    Ensure local volumes are formatted using the NTFS file system (WN10-00-000050).

.DESCRIPTION
    This script verifies that all local volumes are formatted with NTFS. The NTFS file system is required for setting access permissions and auditing, both of which are essential for maintaining the security and proper access controls of a system.

    This check does not apply to system partitions like the Recovery and EFI System Partition.

.NOTES
    STIG ID   : WN10-00-000050
    Control   : Ensure Local Volumes are Formatted Using NTFS
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Ensure-NTFSVolume.ps1
#>

# Get a list of all volumes except system partitions
$volumes = Get-WmiObject Win32_Volume | Where-Object { $_.DriveLetter -ne $null -and $_.FileSystem -ne 'NTFS' }

if ($volumes) {
    Write-Warning "[NON-COMPLIANT] The following volumes are not formatted with NTFS:"
    $volumes | ForEach-Object {
        Write-Host "→ Drive Letter: $($_.DriveLetter) | File System: $($_.FileSystem)" -ForegroundColor Red
    }
    Write-Host "→ Please format all local volumes to NTFS, excluding system partitions." -ForegroundColor Yellow
} else {
    Write-Host "[COMPLIANT] All local volumes are formatted with NTFS." -ForegroundColor Green
}
