---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# ConvertFrom-Base64

## SYNOPSIS
Convert a Base64 encoded string to a plain text string

## SYNTAX

```
ConvertFrom-Base64 [-Text] <String> [<CommonParameters>]
```

## DESCRIPTION
Convert a Base64 encoded string to a plain text string.

## EXAMPLES

### EXEMPLE 1
```
ConvertFrom-Base64 "UwB1AHAAZQByACAAQwBoAGEAaQBuAGUAIAB0AG8AcAAgAHMAZQBjAHIAZQB0AA=="
```

Super Chaine top secret

## PARAMETERS

### -Text
Base64 encoded string, which is to be converted to an plain text string

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
