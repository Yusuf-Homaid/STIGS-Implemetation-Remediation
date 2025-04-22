<#
.TITLE
    Ensure Correct File and Directory Permissions (WN10-00-000095)

.SYNOPSIS
    Verifies the permissions for system files and directories (C:\, Program Files, and Windows) to ensure they conform to the minimum requirements.

.DESCRIPTION
    This script checks the permissions for the following directories:
    - C:\
    - \Program Files
    - \Windows

    If permissions are not in compliance with the required STIG settings, it provides a warning for remediation.

.NOTES
    STIG ID   : WN10-00-000095
    Control   : Permissions for system files and directories must conform to minimum requirements.
    Version   : 1.0
    Author    : Yusuf Homaid
    LinkedIn  : https://www.linkedin.com/in/yusufhomaid
    Date      : 2025-04-22
    Execution : Run as Administrator

.LINK
    https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_10_V2R8_STIG.zip

.EXAMPLE
    .\Check-SystemFilePermissions.ps1
#>

Write-Host "Checking system file and directory permissions..." -ForegroundColor Cyan

# Function to check directory permissions using icacls
function Check-Permissions {
    param([string]$path)

    Write-Host "Checking permissions for $path..." -ForegroundColor Yellow
    $permissions = icacls $path
    Write-Host $permissions -ForegroundColor White
    if ($permissions -notmatch "BUILTIN\\Administrators:\(OI\)\(CI\)\(F\)") {
        Write-Warning "Permissions for $path do not meet the required standards!"
    } else {
        Write-Host "$path permissions are compliant." -ForegroundColor Green
    }
}

# Checking permissions for system directories
Check-Permissions "C:\"
Check-Permissions "C:\Program Files"
Check-Permissions "C:\Windows"

Write-Host "Completed permission check." -ForegroundColor Green
