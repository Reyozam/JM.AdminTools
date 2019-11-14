---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# Get-IPv4Subnet

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### CIDR (Default)
```
Get-IPv4Subnet [-IPv4Address] <IPAddress> [-CIDR] <Int32> [<CommonParameters>]
```

### Mask
```
Get-IPv4Subnet [-IPv4Address] <IPAddress> [-Mask] <String> [<CommonParameters>]
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

### -CIDR
CIDR like /24 without "/"

```yaml
Type: Int32
Parameter Sets: CIDR
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPv4Address
IPv4-Address which is in the subnet

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mask
Subnetmask like 255.255.255.0

```yaml
Type: String
Parameter Sets: Mask
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

### Aucun(e)

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
