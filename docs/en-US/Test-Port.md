---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Test-Port

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### TCP (Default)
```
Test-Port [-ComputerName] <String[]> [-Port] <Int32[]> [[-Protocol] <String>] [[-TcpTimeout] <Int32>]
 [<CommonParameters>]
```

### UDP
```
Test-Port [-ComputerName] <String[]> [-Port] <Int32[]> [[-Protocol] <String>] [[-UdpTimeout] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ComputerName
{{ Fill ComputerName Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
{{ Fill Port Description }}

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Protocol
{{ Fill Protocol Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: TCP, UDP

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TcpTimeout
{{ Fill TcpTimeout Description }}

```yaml
Type: Int32
Parameter Sets: TCP
Aliases:

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UdpTimeout
{{ Fill UdpTimeout Description }}

```yaml
Type: Int32
Parameter Sets: UDP
Aliases:

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Aucun(e)

## OUTPUTS

### System.Management.Automation.PSCustomObject

## NOTES

## RELATED LINKS
