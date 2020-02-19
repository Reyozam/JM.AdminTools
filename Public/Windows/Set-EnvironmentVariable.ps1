function Set-EnvironmentVariable
{
<#
.SYNOPSIS
    Set Environment variable
.DESCRIPTION
    Set Environment variable
.PARAMETER  Name
    Variable name
.PARAMETER  Target
    Environement variable context machine or user
.PARAMETER  Value
    Variable value
.EXAMPLE
    Set-environmentvariable -Name "Test" -value "testValue" -target machine
#> 
    param
    (
        [string]
        [Parameter(Mandatory)]
        $Name,
 
        [string]
        [AllowEmptyString()]
        [Parameter(Mandatory)]
        $Value,
 
        [System.EnvironmentVariableTarget]
        [Parameter(Mandatory)]
        [string]$Target
    )
 
    [Environment]::SetEnvironmentVariable($Name, $Value, $Target)
}