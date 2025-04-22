# STIGS-Implemetation-Remediation- ByYusuf Homaid


*Automating Security Hardening for Windows 10*

This repository contains PowerShell scripts to implement and remediate Windows 10 STIG compliance.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Scripts](#scripts)
    1. [Script 1: Enabling Windows Defender Antivirus (WN10-00-000020)](#script-1-user-account-control-settings)
    2. [Script 2: Disable SMBv1](#script-2-disable-smbv1)
    3. [Script 3: Disable Remote Desktop](#script-3-disable-remote-desktop)
    4. [Script 4: Disable SMBv2](#script-4-disable-smbv2)
    5. [Script 5: Configure Windows Defender Antivirus](#script-5-configure-windows-defender-antivirus)
    ...
3. [Documentation](#documentation)
4. [License](#license)
5. [Contact](#contact)

---

## Introduction
The **Windows 10 STIG** is a set of guidelines for securing Windows 10 systems, created by the DISA. This repository aims to automate the remediation process of these security settings through a collection of PowerShell scripts. These scripts are designed to be simple, efficient, and easy to use in enterprise environments.

For more information, visit the [official STIG documentation](https://public.cyber.mil/stigs/).

---

## Scripts

### Script 1: User Account Control Settings
**Description:**  
This script configures Windows User Account Control (UAC) settings to ensure the system is protected from unauthorized changes.

```powershell
# PowerShell code for UAC settings remediation
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name EnableLUA -Value 1
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name ConsentPromptBehaviorAdmin -Value 5
