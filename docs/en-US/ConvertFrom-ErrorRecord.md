---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# ConvertFrom-ErrorRecord

## SYNOPSIS
Convert Powershell Error

## SYNTAX

```
ConvertFrom-ErrorRecord [-Record] <ErrorRecord> [<CommonParameters>]
```

## DESCRIPTION
Convert Powershell Error in Object to simplify explotation

## EXAMPLES

### EXEMPLE 1
```
C:\ ConvertFrom-ErrorRecord $Error[0]
```

Exception : Le terme Â«get-commandnotfoundÂ» n'est pas reconnu comme nom d'applet de commande, fonction, fichier de script ou programme ex ©cutable.
V ©rifiez l'orthographe du nom, ou si un chemin d'acc ¨s existe,
      v ©rifiez que le chemin d'acc ¨s est correct et r ©essayez.
Reason    : CommandNotFoundException
Target    : get-commandnotfound
Script    :
Line      : 1
Column    : 1

## PARAMETERS

### -Record
{{ Fill Record Description }}

```yaml
Type: ErrorRecord
Parameter Sets: (All)
Aliases:

Required: True
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
