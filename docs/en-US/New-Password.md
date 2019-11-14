---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# New-Password

## SYNOPSIS
Function to generate random password

## SYNTAX

```
New-Password [[-Length] <Int32>] [[-Include] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Function to generate random password

## EXAMPLES

### EXEMPLE 1
```
Generate-Password
```

### EXEMPLE 2
```
Generate-Password -Length 10 -Include LowerCase,UpperCase,Numbers
```

## PARAMETERS

### -Length
Number between 2 and 100
Default 12

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 12
Accept pipeline input: False
Accept wildcard characters: False
```

### -Include
UpperCase
LowerCase
Numbers
SpecialCharacters
Default is all

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: @('UpperCase','LowerCase','Numbers','SpecialCharacters')
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
