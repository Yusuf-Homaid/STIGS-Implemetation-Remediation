# STIGS-Implemetation-Remediation- By Yusuf Homaid


*Automating Security Hardening for Windows 10*

This repository contains PowerShell scripts to implement and remediate Windows 10 STIG compliance.

## Introduction
The **Windows 10 STIG** is a set of guidelines for securing Windows 10 systems, created by the DISA. This repository aims to automate the remediation process of these security settings through a collection of PowerShell scripts. These scripts are designed to be simple, efficient, and easy to use in enterprise environments.

For more information, visit the [official STIG documentation](https://public.cyber.mil/stigs/).


---

## Table of Contents


1. [Scripts](#scripts)
    1. [Script 1: Secure Boot must be enabled on Windows 10 systems (WN10-00-000020)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Secure%20Boot%20must%20be%20enabled%20on%20Windows%2010%20systems%20(WN10-00-000020).ps1)
    2. [Script 2: BitLocker Authentication Configuration (WN10-00-000031)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/BitLocker%20Authentication%20Configuration%20(WN10-00-000031).ps1)
    3. [Script 3: Enabling Password Complexity (WN10-00-000052)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enabling%20Password%20Complexity%20(WN10-00-000052).ps1)
    4. [Script 4: Enabling UAC for Admin Approval Mode (WN10-00-000042)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enabling%20UAC%20for%20Admin%20Approval%20Mode%20(WN10-00-000042).ps1)
    5. [Script 5: Disabling SMBv1 (WN16-00-000411)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20SMBv1%20(WN16-00-000411).ps1)
    6. [Script 6: Disabling LM Hash Storage (WN10-00-000006)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20LM%20Hash%20Storage%20(WN10-00-000006).ps1)
    7. [Script 7: Enforcing Account Lockout (WN10-00-000053)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enforcing%20Account%20Lockout%20(WN10-00-000053).ps1)
    8. [Script 8: Disabling SMBv2 (WN10-00-000014)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20SMBv2%20(WN10-00-000014).ps1)
    9. [Script 9: Enforcing Password History (WN10-00-000070)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enforcing%20Password%20History%20(WN10-00-000070).ps1)
    10. [Script 10: Disabling Windows Store Application (WN10-CC-000020)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disabling%20Windows%20Store%20Application%20(WN10-CC-000020).ps1)
    11. [Script 11: Enforcing Minimum Password Length (CCI-000205)]()
    12. [Script 12: Account Lockout Threshold Enforcement (WN10-AC-000010)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Account%20Lockout%20Threshold%20Enforcement%20(WN10-AC-000010).ps1)
    13. [Script 13: Set Account Lockout Duration to 15 Minutes (WN10-AC-000005)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Set%20Account%20Lockout%20Duration%20to%2015%20Minutes%20(WN10-AC-000005).ps1)
    14. [Script 14: Set Account Lockout Observation Window to 15 Minutes (WN10-00-000105) ](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Set%20Account%20Lockout%20Observation%20Window%20to%2015%20Minutes%20(WN10-00-000105).ps1)
    15. [Script 15: Ensure IIS is Not Installed on Workstation (WN10-00-000100)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensure%20IIS%20is%20Not%20Installed%20on%20Workstation%20(WN10-00-000100).ps1)
    16. [Script 16: Ensure Domain-Joined Systems Use Windows 10 Enterprise Edition 64-bit Version (WN10-00-000005)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensure%20Domain-Joined%20Systems%20Use%20Windows%2010%20Enterprise%20Edition%2064-bit%20Version%20(WN10-00-000005).ps1)
    17. [Script 17: Trusted Platform Module (TPM) (WN10-00-000010)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Trusted%20Platform%20Module%20(TPM)%20(WN10-00-000010).ps1)
    18. [Script 18: UEFI Mode (WN10-00-000015)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/UEFI%20Mode%20(WN10-00-000015).ps1)
    19. [Script 19: Employs Automated Mechanisms for Flaw Remediation (WN10-00-000025)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Employs%20Automated%20Mechanisms%20for%20Flaw%20Remediation%20(WN10-00-000025).ps1)
    20. [Script 20: BitLocker for Full Disk Encryption (WN10-00-000030)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/BitLocker%20for%20Full%20Disk%20Encryption%20(WN10-00-000030).ps1)
    21. [Script 21: Implement Software Allowlisting: Deny-All, Permit-by-Exception (WN10-00-000035) ](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Implement%20Software%20Allowlisting%3A%20Deny-All%2C%20Permit-by-Exception%20(WN10-00-000035).ps1)
    22. [Script 22: Ensure Supported Windows 10 Servicing Level (WN10-00-000040)](http://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensure%20Supported%20Windows%2010%20Servicing%20Level%20(WN10-00-000040).ps1)
    23. [Script 23: Ensure Antivirus is Installed and Active (WN10-00-000045)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensure%20Antivirus%20is%20Installed%20and%20Active%20(WN10-00-000045).ps1)
    24. [Script 24: Ensure Local Volumes are Formatted Using NTFS (WN10-00-000050)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensure%20Local%20Volumes%20are%20Formatted%20Using%20NTFS%20(WN10-00-000050).ps1)
    25. [Script 25: Disable or Remove Inactive Accounts After 35 Days of Inactivity (WN10-00-000065)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disable%20or%20Remove%20Inactive%20Accounts%20After%2035%20Days%20of%20Inactivity%20(WN10-00-000065).ps1)
    26. [Script 26: Limit Access to Non-System-Created File Shares (WN10-00-000060)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Limit%20Access%20to%20Non-System-Created%20File%20Shares%20(WN10-00-000060).ps1)
    27. [Script 27: Limit Backup Operators Group Membership to Backup Accounts Only (WN10-00-000075)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Limit%20Backup%20Operators%20Group%20Membership%20to%20Backup%20Accounts%20Only%20(WN10-00-000075).ps1)
    28. [Script 28: Ensures that standard local user accounts do not exist on a domain-joined system (WN10-00-000085)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensures%20that%20standard%20local%20user%20accounts%20do%20not%20exist%20on%20a%20domain-joined%20system%20(WN10-00-000085).ps1)
    29. [Script 29: Enforce Password Expiration for Local Accounts (WN10-00-000090)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enforce%20Password%20Expiration%20for%20Local%20Accounts%20(WN10-00-000090).ps1)
    30. [Script 30: Ensure SNMP is Not Installed (WN10-00-000105)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensure%20SNMP%20is%20Not%20Installed%20(WN10-00-000105).ps1)
    31. [Script 31: Ensure Correct File and Directory Permissions (WN10-00-000095)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Ensure%20Correct%20File%20and%20Directory%20Permissions%20(WN10-00-000095).ps1)
    32. [Script 32: Remove Certificate Installation Files (*.p12, *.pfx) (WN10-00-000130)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Remove%20Certificate%20Installation%20Files%20(*.p12%2C%20*.pfx)%20(WN10-00-000130).ps1)
    33. [Script 33: Enable Host-Based Firewall (WN10-00-000135)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Enable%20Host-Based%20Firewall%20(WN10-00-000135).ps1)
    34. [Script 34: Configure Data Execution Prevention (DEP) to OptOut (WN10-00-000145)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Configure%20Data%20Execution%20Prevention%20(DEP)%20to%20OptOut%20(WN10-00-000145).ps1)
    35. [Script 35: Disable Bluetooth if not approved by the organization (WN10-00-000210)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Disable%20Bluetooth%20if%20not%20approved%20by%20the%20organization%20(WN10-00-000210).ps1)
    36. [Script 36: Ensures Windows Defender Antivirus updates definitions prior to scanning by setting the required registry value.(WN10-00-000220)](https://github.com/Yusuf-Homaid/STIGS-Implemetation-Remediation/blob/main/Implements%20STIG%3A%20WN10-00-000220%20-%20Windows%20Defender%20must%20check%20for%20the%20latest%20virus.ps1)



---


---
