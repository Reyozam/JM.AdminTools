# :closed_lock_with_key: JM.AdminTools

Some PowerShell helpers for SysAdmin daily tasks

## Installation

You can get the current release from this repository or install this from the PowerShell Gallery:

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Reyozam/JM.AdminTools/master/InstallModule.ps1'))
```



## Functions

### ConvertFrom-Error

Return Error information in a object
```powershell
PS C:\>ConvertFrom-Error $error[0]


Exception : Tentative de division par zéro.

Reason    : RuntimeException

Target    : 

Script    : Test-Error

Line      : 1

Column    : 1
```
### Export-FirewallRules

Export Firewall Rules from criteria
```powershell
PS C:\>Export-FirewallRules -Direction Both -State Enabled -Action Allow
```
### Find-StringInFile

Search for a string in files from a path
```powershell
PS C:\>Find-StringInFile -search "string" -path C:\users\
```
### Get-ARPCache

arp -a powershell version
```powershell
PS C:\>Get-ARPCache
```
### Get-ComputerUptime

Get computer uptime
```powershell
PS C:\>Get-ComputerUptime -computername Server01
```
### Get-InstalledSoftware

Get installed software
```powershell
PS C:\>Get-InstalledSoftware -computername Server01
```
### Get-IPv4Subnet


```powershell

```
### Get-OpenFile

Get open file on a computer
```powershell
PS C:\>Get-OpenFile -computername Computer01

PS C:\>Get-OpenFile -computername Computer01 -filename doc01.docx
```
### Get-RegistryKeyProperties

Get registry key values
```powershell
PS C:\>Get-RegistryKeyProperties -Path HKCU:\Environment
```
### Get-RemoteLocalGroup

Get member of a local group on remote computer
```powershell
PS C:\>Get-RemoteLocalGroup -computerName server01 -group "Administrators"
```
### Get-WebFile

DownloadFile from a URL
```powershell
PS C:\>Get-WebFile https:\\donwload.fr\file.zip
```
### Import-FirewallRules

Import Firewall Rules from criteria
```powershell
PS C:\>Export-FirewallRules -ExoortFile C:\BackupFirewall.json
```
### Invoke-RunAs

Start a process as différent user
```powershell
PS C:\>$Credential = Get-Credential

Invoke-RunAs -command cmd.exe -credential $Credential
```
### New-Password

Generate Password
```powershell
PS C:\>New-Password -length 20 -include UpperCase,LowerCase, Numbers
```
### Set-EnvironmentVariable

Set Environment variable
```powershell
PS C:\>Set-environmentvariable -Name "Test" -value "testValue" -target machine
```
### Start-PortScan

Start a port scan on the selected computer on common TCP Ports
```powershell
PS C:\>Start-PortScan

Service : FTP Data

Port    : 20

Status  : Closed



Service : FTP Command

Port    : 21

Status  : Closed



Service : SSH

Port    : 22

Status  : Closed



Service : TelNet

Port    : 23

Status  : Closed

...
```
### Start-ProcessQuiet

Start a process in background and return output
```powershell
PS C:\>Start-ProcessQuiet -Filepath "cmd" -argument "/c ipconfig"
```
### Start-Supervision

Monitoring ping on multiple target
```powershell
PS C:\>Start-Supervision  -hosts nas,jeedom,bigone,toto

_____________________________________________________

| HOST   | STATUS | SUCCESS  | FAILURE  | ATTEMPTS  |

| nas    | UP     | 100,00%  | 0,00%    | 5         |

| jeedom | UP     | 100,00%  | 0,00%    | 5         |

| bigone | UP     | 100,00%  | 0,00%    | 5         |

| toto   | DOWN   | 0,00%    | 100,00%  | 5         |
```
### Sync-Folder

Sync two folder via Robocopy
```powershell
PS C:\>Sync-Folder -source C:\Folder01 -destination C:\Folder02
```
### Test-Credential

Test local or AD credential on remote computer
```powershell
PS C:\>$Credential = Get-Credential

test-credential -credential  -domain contoso.com

Test-Credential -credential -computername server01
```
### Test-Port

Test port status on remote computer
```powershell
PS C:\>Test-Port -computername Server01,Server02 -Port 80,443
```
### Test-RemoteManagement

Test remote management capabilities of a target computer
```powershell
PS C:\>Test-RemoteManagement -computername Server01,Server02 -Protocol WMI,WinRM
```
### Trace-Log

Read log and highlight Success/Warning/Error
```powershell
PS C:\>Trace-Log -LogPath C:\temp\log.log -Wait
```
### Trace-Word

Look and highligh from words in a file content
```powershell
PS C:\>Get-Content file.txt | Trace-Word -words "Computer01","Server02"
```
### Update-StringInFile

Replace a string in one or multiple files.

Binary files (*.zip, *.exe, etc.) are not touched by this script.
```powershell
PS C:\>Update-StringInFile -Path E:\Temp\Files\ -Find "Test1" -Replace "Test2" -Verbose


VERBOSE: Binary files like (*.zip, *.exe, etc...) are ignored

VERBOSE: Total files with string to replace found: 3

VERBOSE: Current file: E:\Temp\Files\File_01.txt

VERBOSE: Number of strings to replace in current file: 1

VERBOSE: Current file: E:\Temp\Files\File_02.txt

VERBOSE: Number of strings to replace in current file: 1

VERBOSE: Current file: E:\Temp\Files\File_03.txt

VERBOSE: Number of strings to replace in current file: 2
```
### Watch-Service

Watch a service and restart it if it stops
```powershell
PS C:\>Watch-Service -ServiceName wuaserv
```
