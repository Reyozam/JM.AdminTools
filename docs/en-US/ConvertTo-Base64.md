---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# ConvertTo-Base64

## SYNOPSIS
Convert a text (command) to an Base64 encoded string

## SYNTAX

### Text (Default)
```
ConvertTo-Base64 [-Text] <String> [<CommonParameters>]
```

### File
```
ConvertTo-Base64 [-FilePath] <String> [<CommonParameters>]
```

## DESCRIPTION
Convert a text (command) to an Base64 encoded string.

## EXAMPLES

### EXEMPLE 1
```
ConvertTo-Base64 -Text 'Set-Location -Path "E:\Temp\Files\";Get-ChildItem'
```

UwBlAHQALQBMAG8AYwBhAHQAaQBvAG4AIAAtAFAAYQB0AGgAIAAiAEUAOgBcAFQAZQBtAHAAXABGAGkAbABlAHMAXAAiADsARwBlAHQALQBDAGgAaQBsAGQASQB0AGUAbQA=

powershell.exe -NoProfile -EncodedCommand "UwBlAHQALQBMAG8AYwBhAHQAaQBvAG4AIAAtAFAAYQB0AGgAIAAiAEUAOgBcAFQAZQBtAHAAXABGAGkAbABlAHMAXAAiADsARwBlAHQALQBDAGgAaQBsAGQASQB0AGUAbQA="

    Directory: E:\Temp\Files


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        8/21/2016   5:54 PM              5 File_01.txt
-a----        8/20/2016  12:54 AM              9 File_02.txt
-a----        8/20/2016  12:08 AM             14 File_03.txt
-a----        6/24/2016   5:01 PM            120 File_04.zip
-a----        8/20/2016  12:54 AM             14 File_05.txt

## PARAMETERS

### -Text
Text (command), which is to be converted to a Base64 encoded string

```yaml
Type: String
Parameter Sets: Text
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilePath
Path to the file where the text (command) is stored, which is to be converterd to a Base64 encoded string

```yaml
Type: String
Parameter Sets: File
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
