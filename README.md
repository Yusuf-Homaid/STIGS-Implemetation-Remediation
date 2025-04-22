# STIGS-Implemetation-Remediation- By Yusuf Homaid


*Automating Security Hardening for Windows 10*

This repository contains PowerShell scripts to implement and remediate Windows 10 STIG compliance.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Scripts](#scripts)
    1. [Script 1: Enabling Windows Defender Antivirus (WN10-00-000020)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enabling%20Windows%20Defender%20Antivirus%20(WN10-00-000020))
    2. [Script 2: BitLocker Authentication Configuration (WN10-00-000031)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/BitLocker%20Authentication%20Configuration%20(WN10-00-000031))
    3. [Script 3: Enabling Password Complexity (WN10-00-000052)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enabling%20Password%20Complexity%20(WN10-00-000052))
    4. [Script 4: Enabling UAC for Admin Approval Mode (WN10-00-000042)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enabling%20UAC%20for%20Admin%20Approval%20Mode%20(WN10-00-000042))
    5. [Script 5: Disabling SMBv1 (WN10-00-000015)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20SMBv1%20(WN10-00-000015))
    6. [Script 6: Disabling LM Hash Storage (WN10-00-000006)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20LM%20Hash%20Storage%20(WN10-00-000006))
    7. [Script 7: Enforcing Account Lockout (WN10-00-000053)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enforcing%20Account%20Lockout%20(WN10-00-000053))
    8. [Script 8: Disabling SMBv2 (WN10-00-000014)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20SMBv2%20(WN10-00-000014))
    9. [Script 9: Enforcing Password History (WN10-00-000070)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enforcing%20Password%20History%20(WN10-00-000070))
    10. [Script 10: Disabling Windows Store Application (WN10-CC-000020)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20Windows%20Store%20Application%20(WN10-CC-000020))
    11. [Script 11: Enforcing Minimum Password Length (WN10-00-000075)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enforcing%20Minimum%20Password%20Length%20(WN10-00-000075))
    12. [Script 12: Account Lockout Threshold Enforcement (WN10-00-000095)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Account%20Lockout%20Threshold%20Enforcement%20(WN10-00-000095))
    13. [Script 13: Set Account Lockout Duration to 15 Minutes (WN10-00-000100)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Set%20Account%20Lockout%20Duration%20to%2015%20Minutes%20(WN10-00-000100))
    14. [Script 14: Set Account Lockout Observation Window to 15 Minutes (WN10-00-000105) ](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Set%20Account%20Lockout%20Observation%20Window%20to%2015%20Minutes%20(WN10-00-000105))
    15. 
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
