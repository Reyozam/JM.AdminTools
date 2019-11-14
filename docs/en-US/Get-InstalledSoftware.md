---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# Get-InstalledSoftware

## SYNOPSIS
Get all installed software with DisplayName, Publisher and UninstallString

## SYNTAX

```
Get-InstalledSoftware [[-Search] <String>] [[-ComputerName] <String>] [[-Credential] <PSCredential>]
 [<CommonParameters>]
```

## DESCRIPTION
Get all installed software with DisplayName, Publisher and UninstallString from a local or remote computer.
(Remote Powershell must be enabled)

## EXAMPLES

### EXEMPLE 1
```
Get-InstalledSoftware
```

### EXEMPLE 2
```
Get-InstalledSoftware -Search "*chrome*"
```

DisplayName     : Google Chrome
Publisher       : Google Inc.
UninstallString : "C:\Program Files (x86)\Google\Chrome\Application\51.0.2704.103\Installer\setup.exe" --uninstall --multi-install --chrome --system-level
InstallLocation : C:\Program Files (x86)\Google\Chrome\Application
InstallDate     : 20160506

### EXEMPLE 3
```
Get-InstalledSoftware -Search "*firefox*" -ComputerName PC01
```

DisplayName     : Mozilla Firefox 47.0.1 (x86 de)
Publisher       : Mozilla
UninstallString : "C:\Program Files (x86)\Mozilla Firefox\uninstall\helper.exe"
InstallLocation : C:\Program Files (x86)\Mozilla Firefox
InstallDate     :

## PARAMETERS

### -Search
Search for product name (You can use wildcards like "*ProductName*

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
ComputerName or IPv4-Address of the remote computer

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credentials to authenticate agains a remote computer

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
