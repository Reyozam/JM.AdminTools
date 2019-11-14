---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Start-ProcessWithCapture

## SYNOPSIS
Start processes and capturing output.

## SYNTAX

```
Start-ProcessWithCapture [-FilePath] <String> [-ArgumentList] <String> [[-WorkingDirectory] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Start processes and capturing output.

## EXAMPLES

### EXEMPLE 1
```
$Return = Start-ProcessWithCapture -FilePath 'ping' -ArgumentList "google.fr"
```

Name                           Value
----                           -----
stdout                         ...
exitcode                       0
stderr

$Return.stdout

Envoi d'une requ ªte 'ping' sur google.fr \[2a00:1450:4007:810::2003\] avec 32 octets de donn ©es :
 R ©ponse de 2a00:1450:4007:810::2003 : temps=2 ms
 R ©ponse de 2a00:1450:4007:810::2003 : temps=2 ms
 ...

## PARAMETERS

### -FilePath
{{ Fill FilePath Description }}

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

### -ArgumentList
Argument List for Process

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WorkingDirectory
Argument List for Process

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $pwd.path
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
