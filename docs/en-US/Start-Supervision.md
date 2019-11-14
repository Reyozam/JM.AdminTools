---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Start-Supervision

## SYNOPSIS
Show a graphical table with ping status of multiple hosts

## SYNTAX

```
Start-Supervision [-Hosts] <String[]> [-ToCsv <ParameterAttribute>] [<CommonParameters>]
```

## DESCRIPTION
Show a graphical table with ping status of multiple hosts

## EXAMPLES

### EXEMPLE 1
```
Start-Supervision "unknow.fr","localhost"
```

| HOST      | STATUS | SUCCESS  | FAILURE  | ATTEMPTS  |
| unknow.fr | DOWN   | 0,00%    | 100,00%  | 1         |
| localhost | UP     | 100,00%  | 0,00%    | 1         |

## PARAMETERS

### -Hosts
{{ Fill Hosts Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Name, ComputerName, Computer

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ToCsv
{{ Fill ToCsv Description }}

```yaml
Type: ParameterAttribute
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
