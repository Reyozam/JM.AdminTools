function Get-RegistryKeyProperties
{
<#
.SYNOPSIS
    Get registry key values
.DESCRIPTION
    Get registry key values
.PARAMETER  Path
    Registry Path
.EXAMPLE
    Get-RegistryKeyProperties -Path HKCU:\Environment
#> 
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject[]])]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateScript({Test-Path -Path $_})][ValidateNotNullOrEmpty()][System.String]$Path
    )

    Begin { }

    Process
    {
        Get-Item -Path $Path | Select-Object -ExpandProperty Property | ForEach-Object {
            Write-Output -InputObject ([PSCustomObject]@{"Path" = $Path; "Property" = "$_"; "Value" = (Get-ItemProperty -Path $Path -Name $_ | Select-Object -ExpandProperty $_) })
        }
    }

    End { }
}

