---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version: https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Get-WindowsProductKey.README.md
schema: 2.0.0
---

# Get-WUFileByID

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### ByKBLinksOnly
```
Get-WUFileByID [-KB] <String> [-SearchCriteria] <String> [[-SearchType] <String>] [[-Platform] <String>]
 [-LinksOnly] [-ForceSSL] [[-SearchPageTemplate] <String>] [[-DownloadPageTemplate] <String>]
 [<CommonParameters>]
```

### Default
```
Get-WUFileByID [-KB] <String> [-SearchCriteria] <String> [[-SearchType] <String>] [[-Platform] <String>]
 [[-DestinationFolder] <String>] [-ForceSSL] [[-SearchPageTemplate] <String>]
 [[-DownloadPageTemplate] <String>] [<CommonParameters>]
```

### ByGUIDLinksOnly
```
Get-WUFileByID [-GUID] <Guid> [-LinksOnly] [-ForceSSL] [[-DownloadPageTemplate] <String>] [<CommonParameters>]
```

### ByGUID
```
Get-WUFileByID [-GUID] <Guid> [[-DestinationFolder] <String>] [-ForceSSL] [[-DownloadPageTemplate] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -DestinationFolder
{{ Fill DestinationFolder Description }}

```yaml
Type: String
Parameter Sets: Default, ByGUID
Aliases:

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DownloadPageTemplate
{{ Fill DownloadPageTemplate Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceSSL
{{ Fill ForceSSL Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GUID
{{ Fill GUID Description }}

```yaml
Type: Guid
Parameter Sets: ByGUIDLinksOnly, ByGUID
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KB
{{ Fill KB Description }}

```yaml
Type: String
Parameter Sets: ByKBLinksOnly, Default
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinksOnly
{{ Fill LinksOnly Description }}

```yaml
Type: SwitchParameter
Parameter Sets: ByKBLinksOnly, ByGUIDLinksOnly
Aliases:

Required: True
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Platform
{{ Fill Platform Description }}

```yaml
Type: String
Parameter Sets: ByKBLinksOnly, Default
Aliases:
Accepted values: x86, x64

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchCriteria
{{ Fill SearchCriteria Description }}

```yaml
Type: String
Parameter Sets: ByKBLinksOnly, Default
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchPageTemplate
{{ Fill SearchPageTemplate Description }}

```yaml
Type: String
Parameter Sets: ByKBLinksOnly, Default
Aliases:

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchType
{{ Fill SearchType Description }}

```yaml
Type: String
Parameter Sets: ByKBLinksOnly, Default
Aliases:
Accepted values: Product, Title, ProductAndTitle

Required: False
Position: Nommé
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Aucun(e)

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
