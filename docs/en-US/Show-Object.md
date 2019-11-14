---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Show-Object

## SYNOPSIS
Provides a graphical interface to let you explore and navigate an object.

## SYNTAX

```
Show-Object [[-InputObject] <Object>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXEMPLE 1
```
$ps = { Get-Process -ID $pid }.Ast
```

PS \> Show-Object $ps

## PARAMETERS

### -InputObject
The object to examine

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
