function Export-FirewallRules
{
<#
.SYNOPSIS
    Export Firewall Rules
.DESCRIPTION
    Export Firewall Rules from criteria
.PARAMETER ExportFile
    Name of JSON File
.PARAMETER Direction
    Firewall flow direction
.PARAMETER State
    Firewall flow state
.PARAMETER Action
    Firewall flow action
.EXAMPLE
    Export-FirewallRules -Direction Both -State Enabled -Action Allow
#>
    Param(
        [Parameter()][string]$ExportFile = ".\FirewallRules_$env:COMPUTERNAME.json",
        [Parameter()][ValidateSet("Inbound", "Outbound", "Both")]$Direction = "Both",
        [Parameter()][ValidateSet("Enabled", "Disabled", "Both")]$State = "Both",
        [Parameter()][ValidateSet("Allow", "Block", "Both")]$Action = "Both"
    )

    if ($Direction -eq "Both") { $Direction = "*" }

    # Filter by state
    if ($State -eq "Both") { $RuleState = "*" }
    if ($State -eq "Enabled") { $RuleState = "True" }
    if ($State -eq "Disabled") { $RuleState = "False" }

    # Filter by action
    if ($Action -eq "Both") { $Action = "*" }

    $FirewallRules = Get-NetFirewallRule -DisplayName * -PolicyStore "ActiveStore" | Where-Object { $_.Direction -like $Direction -and $_.Enabled -like $RuleState -And $_.Action -like $Action }

    $FirewallRuleSet = ForEach ($Rule In $FirewallRules)
    {
        
        Write-Verbose "Processing rule `"$($Rule.DisplayName)`" ($($Rule.Name))" -Verbose

        # Retrieve addresses,
        $AdressFilter = $Rule | Get-NetFirewallAddressFilter
        # ports,
        $PortFilter = $Rule | Get-NetFirewallPortFilter
        # application,
        $ApplicationFilter = $Rule | Get-NetFirewallApplicationFilter
        # service,
        $ServiceFilter = $Rule | Get-NetFirewallServiceFilter
        # interface,
        $InterfaceFilter = $Rule | Get-NetFirewallInterfaceFilter
        # interfacetype
        $InterfaceTypeFilter = $Rule | Get-NetFirewallInterfaceTypeFilter
        # and security settings
        $SecurityFilter = $Rule | Get-NetFirewallSecurityFilter

        
        [PSCustomObject]@{
            Name                = $Rule.Name
            DisplayName         = $Rule.DisplayName
            Description         = $Rule.Description
            Group               = $Rule.Group
            Enabled             = $Rule.Enabled
            Profile             = $Rule.Profile
            Platform            = $Rule.Platform -join ","
            Direction           = $Rule.Direction
            Action              = $Rule.Action
            EdgeTraversalPolicy = $Rule.EdgeTraversalPolicy
            LooseSourceMapping  = $Rule.LooseSourceMapping
            LocalOnlyMapping    = $Rule.LocalOnlyMapping
            Owner               = $Rule.Owner
            LocalAddress        = $AdressFilter.LocalAddress -join ","
            RemoteAddress       = $AdressFilter.RemoteAddress -join ","
            Protocol            = $PortFilter.Protocol
            LocalPort           = $PortFilter.LocalPort -join ","
            RemotePort          = $PortFilter.RemotePort -join ","
            IcmpType            = $PortFilter.IcmpType -join ","
            DynamicTarget       = $PortFilter.DynamicTarget
            Program             = $ApplicationFilter.Program -Replace "$($ENV:SystemRoot.Replace("\","\\"))\\", "%SystemRoot%\" -Replace "$(${ENV:ProgramFiles(x86)}.Replace("\","\\").Replace("(","\(").Replace(")","\)"))\\", "%ProgramFiles(x86)%\" -Replace "$($ENV:ProgramFiles.Replace("\","\\"))\\", "%ProgramFiles%\"
            Package             = $ApplicationFilter.Package
            Service             = $ServiceFilter.Service
            InterfaceAlias      = $InterfaceFilter.InterfaceAlias -join ","
            InterfaceType       = $InterfaceTypeFilter.InterfaceType
            LocalUser           = $SecurityFilter.LocalUser
            RemoteUser          = $SecurityFilter.RemoteUser
            RemoteMachine       = $SecurityFilter.RemoteMachine
            Authentication      = $SecurityFilter.Authentication
            Encryption          = $SecurityFilter.Encryption
            OverrideBlockRules  = $SecurityFilter.OverrideBlockRules
        }
    }

    $FirewallRuleSet | ConvertTo-JSON | Set-Content $ExportFile
	
}