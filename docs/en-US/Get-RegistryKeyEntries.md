---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-LastBootTime.README.md
schema: 2.0.0
---

# Get-RegistryKeyEntries

## SYNOPSIS
Gets all of the properties and their values in a registry key.

## SYNTAX

```
Get-RegistryKeyEntries [-Path] <String> [<CommonParameters>]
```

## DESCRIPTION
Gets all of the properties and their values in a registry key.

## EXAMPLES

### EXEMPLE 1
```
Get-RegistryEntries -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall
```

## PARAMETERS

### -Path
{{ Fill Path Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject[]
## NOTES

## RELATED LINKS
