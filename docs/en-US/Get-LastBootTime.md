---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-LastBootTime.README.md
schema: 2.0.0
---

# Get-LastBootTime

## SYNOPSIS
Get the time when a computer is booted

## SYNTAX

```
Get-LastBootTime [[-ComputerName] <String[]>] [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Get the time when a computer is booted.

## EXAMPLES

### EXEMPLE 1
```
Get-LastBootTime -ComputerName Windows7x64
```

ComputerName LastBootTime
------------ ------------
Windows7x64  8/21/2016 3:25:29 PM

## PARAMETERS

### -ComputerName
ComputerName or IPv4-Address of the remote computer

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
Position: 2
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

[https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-LastBootTime.README.md](https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-LastBootTime.README.md)

