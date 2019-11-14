---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Update-StringInFile

## SYNOPSIS
Replace a string in one or multiple files

## SYNTAX

```
Update-StringInFile [[-Path] <String>] [-Find] <String> [-Replace] <String> [-CaseSensitive] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Replace a string in one or multiple files.

Binary files (*.zip, *.exe, etc.) are not touched by this script.

## EXAMPLES

### EXEMPLE 1
```
Update-StringInFile -Path E:\Temp\Files\ -Find "Test1" -Replace "Test2" -Verbose
```

VERBOSE: Binary files like (*.zip, *.exe, etc...) are ignored
VERBOSE: Total files with string to replace found: 3
VERBOSE: Current file: E:\Temp\Files\File_01.txt
VERBOSE: Number of strings to replace in current file: 1
VERBOSE: Current file: E:\Temp\Files\File_02.txt
VERBOSE: Number of strings to replace in current file: 1
VERBOSE: Current file: E:\Temp\Files\File_03.txt
VERBOSE: Number of strings to replace in current file: 2

## PARAMETERS

### -Path
Folder where the files are stored (will search recursive)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (Get-Location)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Find
String to find

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

### -Replace
String to replace

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CaseSensitive
String must be case sensitive (Default=false)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
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
