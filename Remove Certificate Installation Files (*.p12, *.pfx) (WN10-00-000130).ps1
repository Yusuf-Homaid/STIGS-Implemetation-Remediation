<#
.TITLE
    Remove Certificate Installation Files (*.p12, *.pfx) (WN10-00-000130)

.SYNOPSIS
    Searches for and removes any software certificate installation files (.p12, .pfx) from the system.

.DESCRIPTION
    This script searches all drives for files with extensions .p12 and .pfx (commonly used for software certificates).
    If found, it removes those files unless they are related to server-based applications that require them (e.g., Oracle Wallet Manager or Adobe PreFlight).
    The use of these certificate installation files for end users is considered less secure than using hardware-based certificates.

.NOTES
    STIG ID   : WN10-00-000130
    Control   : Software certificate installation files must be removed.
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Remove-CertificateInstallationFiles.ps1
#>

Write-Host "Searching for software certificate installation files (*.p12, *.pfx)..." -ForegroundColor Cyan

# Function to remove certificate installation files
function Remove-CertificateFiles {
    param([string]$path, [string]$extension)

    Write-Host "Searching for *$extension files in $path..." -ForegroundColor Yellow
    $files = Get-ChildItem -Path $path -Recurse -Filter "*$extension" -ErrorAction SilentlyContinue

    foreach ($file in $files) {
        Write-Host "Found certificate installation file: $($file.FullName)" -ForegroundColor Red
        try {
            Remove-Item $file.FullName -Force
            Write-Host "Removed file: $($file.FullName)" -ForegroundColor Green
        } catch {
            Write-Host "Failed to remove file: $($file.FullName)" -ForegroundColor Yellow
        }
    }
}

# Search all drives for .p12 and .pfx files
$drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -gt 0 }

foreach ($drive in $drives) {
    Remove-CertificateFiles $drive.Root ".p12"
    Remove-CertificateFiles $drive.Root ".pfx"
}

Write-Host "Completed search and removal of certificate installation files." -ForegroundColor Green
