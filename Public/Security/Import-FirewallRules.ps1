function Import-FirewallRules
{
<#
.SYNOPSIS
    Import Firewall Rules
.DESCRIPTION
    Import Firewall Rules from criteria
.PARAMETER ExportFile
    Name of Exported JSON File
.EXAMPLE
    Export-FirewallRules -ExoortFile C:\BackupFirewall.json
#>
    Param
    (
        [Parameter()][string]$ExportFile = ".\FirewallRules_$env:COMPUTERNAME.json"
    )

    try
    {
        $FirewallRules = Get-Content $ExportFile -ErrorAction Stop | ConvertFrom-JSON -ErrorAction Stop
    }
    catch
    {
        throw $_.Exception.Message
    }
		


    ForEach ($Rule In $FirewallRules)
    {
        # generate Hashtable for New-NetFirewallRule parameters
        $RuleSplatHash = @{
            Name                = $Rule.Name
            Displayname         = $Rule.Displayname
            Description         = $Rule.Description
            Group               = $Rule.Group
            Enabled             = $Rule.Enabled
            Profile             = $Rule.Profile
            Platform            = if (![string]::IsNullOrEmpty($Rule.Platform)){$Rule.Platform -split ","} else {@()}
            Direction           = $Rule.Direction
            Action              = $Rule.Action
            EdgeTraversalPolicy = $Rule.EdgeTraversalPolicy
            LooseSourceMapping  = [System.Convert]::ToBoolean($Rule.LooseSourceMapping)
            LocalOnlyMapping    = [System.Convert]::ToBoolean($Rule.LocalOnlyMapping)
            LocalAddress        = if (![string]::IsNullOrEmpty($Rule.LocalAddress)){$Rule.LocalAddress -split ","} else {"Any"}
            RemoteAddress       = if (![string]::IsNullOrEmpty($Rule.RemoteAddress)){$Rule.RemoteAddress -split ","} else {"Any"}
            Protocol            = $Rule.Protocol
            LocalPort           = if (![string]::IsNullOrEmpty($Rule.LocalPort)){$Rule.LocalPort -split ","} else {"Any"}
            RemotePort          = if (![string]::IsNullOrEmpty($Rule.RemotePort)){$Rule.RemotePort -split ","} else {"Any"}
            IcmpType            = if (![string]::IsNullOrEmpty($Rule.IcmpType)){$Rule.IcmpType -split ","} else {"Any"}
            DynamicTarget       = if ([string]::IsNullOrEmpty($Rule.DynamicTarget)) { "Any" } else { $Rule.DynamicTarget }
            Program             = $Rule.Program
            Service             = $Rule.Service
            InterfaceAlias      = if (![string]::IsNullOrEmpty($Rule.InterfaceAlias)){$Rule.InterfaceAlias -split ","} else {"Any"}
            InterfaceType       = $Rule.InterfaceType
            LocalUser           = $Rule.LocalUser
            RemoteUser          = $Rule.RemoteUser
            RemoteMachine       = $Rule.RemoteMachine
            Authentication      = $Rule.Authentication
            Encryption          = $Rule.Encryption
            OverrideBlockRules  = [System.Convert]::ToBoolean($Rule.OverrideBlockRules)
        }


        if (![string]::IsNullOrEmpty($Rule.Owner)) { $RuleSplatHash.Owner = $Rule.Owner }
        if (![string]::IsNullOrEmpty($Rule.Package)) { $RuleSplatHash.Package = $Rule.Package }

        Write-Verbose "Generating firewall rule `"$($Rule.DisplayName)`" ($($Rule.Name))" -Verbose
        # remove rule if present
        Get-NetFirewallRule -EA SilentlyContinue -Name $Rule.Name | Remove-NetFirewallRule

        # Splatting
        New-NetFirewallRule -EA Continue @RuleSplatHash
    }
}