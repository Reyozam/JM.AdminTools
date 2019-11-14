---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Test-Credential

## SYNOPSIS
Test an authentification in AD or local context

## SYNTAX

### Domain (Default)
```
Test-Credential [-Credential <PSCredential>] [-Context <String>] [-Domain <String>] [<CommonParameters>]
```

### Machine
```
Test-Credential [-Credential <PSCredential>] [-Context <String>] [-ComputerName <String>] [<CommonParameters>]
```

## DESCRIPTION
Test an authentification in AD or local context

## EXAMPLES

### EXEMPLE 1
```
#AD Credentials
```

PS C:\\\> $cred = get-credential
PS C:\\\> Test-Credential $cred
True

### EXEMPLE 2
```
#Local credentials
```

PS C:\\\> $cred = get-credential
PS C:\\\> Test-Credential -ComputerName SomeComputer -Credential $cred

## PARAMETERS

### -Credential
{{ Fill Credential Description }}

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $( Get-Credential -Message "Please provide credentials to test" )
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Context
{{ Fill Context Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Domain
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
{{ Fill ComputerName Description }}

```yaml
Type: String
Parameter Sets: Machine
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
{{ Fill Domain Description }}

```yaml
Type: String
Parameter Sets: Domain
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
