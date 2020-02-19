# :closed_lock_with_key: JM.AdminTools

Some PowerShell helpers for SysAdmin daily tasks

## Installation

You can get the current release from this repository or install this from the PowerShell Gallery:

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Reyozam/JM.ScriptTools/master/InstallModule.ps1'))
```



## Functions

### Write-Log

This function output formatted log event to console, logfile or both.

```powershell
Write-Log -StartLog -LogFile $LogFile;
Write-Log -Level Info -Message "Info Log Example" -LogFile $LogFile;
Write-Log -Level Success -Message "Success Log Example" -LogFile $LogFile;
Write-Log -Level Warning -Message "Warning Log Example" -LogFile $LogFile;
Write-Log -Level Error -Message "Error Log Example" -LogFile $LogFile;
Write-Log -Level Info -Message "Send only to the console" -Tab 3;
Write-Log -EndLog -LogFile $LogFile
```

![Write-Log](img/Write-Log.jpg)

###### LogFile Output :

```
[10:02:05:155] [INFO   ] Info Log Example
[10:02:05:158] [SUCCESS] Success Log Example
[10:02:05:163] [WARNING] Warning Log Example
[10:02:05:167] [ERROR  ] Error Log Example
```