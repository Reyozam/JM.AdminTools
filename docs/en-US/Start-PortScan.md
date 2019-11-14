---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Start-PortScan

## SYNOPSIS
Start a port scan on the selected computer.

## SYNTAX

```
Start-PortScan [[-ComputerName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Start a port scan on the selected computer on common TCP Ports

## EXAMPLES

### EXEMPLE 1
```
Start-PortScan
```

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

## PARAMETERS

### -ComputerName
{{ Fill ComputerName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Localhost
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
