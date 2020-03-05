function Set-EnvironmentVariable
{
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