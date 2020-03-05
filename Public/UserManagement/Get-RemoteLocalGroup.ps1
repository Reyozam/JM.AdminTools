function Get-RemoteLocalGroup
{
<#
.SYNOPSIS
    Get member of a local group on remote computer
.DESCRIPTION
    Get member of a local group on remote computer
.PARAMETER ComputerName
    Targtet computer
.PARAMETER Group
	Target group
.EXAMPLE
    Get-RemoteLocalGroup -computerName server01 -group "Administrators" 
#>   
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias('Hostname', 'DNSHostName')] 
        [string[]]$Computername = "localhost",
    
        [Parameter(Mandatory = $false, Position = 1)]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string]$Group = "Administrators",

        $Credential = [System.Management.Automation.PSCredential]::Empty
    )
    
    Begin
    {
        if ($PSBoundParameters.ContainsKey("Credential"))
        {
            $PSDefaultParameterValues = @{"Invoke-Command:Credential" = $Credential }
        } 
    }
    Process
    {
        foreach ($Computer in $Computername)
        {

            $GroupMember = Invoke-Command -Comp  $Computer -ScriptBlock {
                net localgroup $args[0]
            } -ArgumentList $Group
            for ($i = 6; $i -lt $GroupMember.length - 3; $i++)
            {
                #Return as hash table and turn into PSObjects.
                $properties = @{ComputerName = $Computer
                    UserName                 = $GroupMember[$i]
                }
                $obj = New-Object -TypeName PSObject -Property $properties
                Write-Output $obj
            }
                    
     
        }
                                                            
    }
}