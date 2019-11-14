---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# Copy-WebFile

## SYNOPSIS
Download locally file from web url

## SYNTAX

```
Copy-WebFile [-Source] <Uri> [[-DownloadPath] <String>] [<CommonParameters>]
```

## DESCRIPTION
Download locally file from web url

## EXAMPLES

### EXEMPLE 1
```
C:\ Copy-WebFile -Source https:\\someurl.com\file.exe -Destination $Home\Download
```

## PARAMETERS

### -Source
{{ Fill Source Description }}

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DownloadPath
{{ Fill DownloadPath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $Pwd.path
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
