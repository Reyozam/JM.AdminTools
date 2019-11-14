---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# Find-StringInFile

## SYNOPSIS
Find String in one or more files

## SYNTAX

```
Find-StringInFile [-Search] <String> [[-Path] <String>] [-CaseSensitive] [<CommonParameters>]
```

## DESCRIPTION
Find String in one or more files

## EXAMPLES

### EXEMPLE 1
```
Find-StringInFile -Path "C:\Scripts\FolderWithFiles" -Search "Test01"
```

Filename    Path                      LineNumber Matches
--------    ----                      ---------- -------
File_01.txt E:\Temp\Files\File_01.txt          1 {Test01}
File_02.txt E:\Temp\Files\File_02.txt          1 {TEST01}
File_03.txt E:\Temp\Files\File_03.txt          1 {TeST01}

## PARAMETERS

### -Search
String to find

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

### -Path
Folder where the files are stored (search is recursive)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Get-Location)
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
Position: 3
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
