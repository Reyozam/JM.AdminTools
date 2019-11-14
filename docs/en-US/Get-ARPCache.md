---
external help file: JM.AdminTools-help.xml
Module Name: JM.AdminTools
online version:
schema: 2.0.0
---

# Get-ARPCache

## SYNOPSIS
Get the ARP cache

## SYNTAX

```
Get-ARPCache [<CommonParameters>]
```

## DESCRIPTION
Get the Address Resolution Protocol (ARP) cache

## EXAMPLES

### EXEMPLE 1
```
Get-ARPCache
```

Interface      IPv4Address     MACAddress        Type
---------      -----------     ----------        ----
192.168.56.1   192.168.56.255  FF-00-00-00-00-FF static
192.168.56.1   224.0.0.22      01-00-5E-00-00-16 static
192.168.56.1   239.255.255.250 01-00-00-00-00-FA static
192.168.178.22 192.168.178.1   5C-00-00-00-00-77 dynamic
192.168.178.22 192.168.178.255 FF-00-00-00-00-FF static
192.168.178.22 224.0.0.22      01-00-00-00-00-16 static
192.168.178.22 239.255.255.250 01-00-00-00-00-FA static

### EXEMPLE 2
```
Get-ARPCache | Where-Object {$_.Interface -eq "192.168.178.22"}
```

Interface      IPv4Address     MACAddress        Type
---------      -----------     ----------        ----
192.168.178.22 192.168.178.1   5C-00-00-00-00-77 dynamic
192.168.178.22 192.168.178.255 FF-00-00-00-00-FF static
192.168.178.22 224.0.0.22      01-00-00-00-00-16 static
192.168.178.22 239.255.255.250 01-00-00-00-00-FA static

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
