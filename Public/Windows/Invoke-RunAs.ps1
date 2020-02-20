
function Invoke-RunAs
{
<#
.SYNOPSIS
    Start a process as différent user
.DESCRIPTION
    Start a process as différent user
.PARAMETER  Command
    Executable path
.PARAMETER  Arguments
    Executable arguments
.EXAMPLE
    $Credential = Get-Credential
    Invoke-RunAs -command cmd.exe -credential $Credential
#> 
    [CmdletBinding()]
    Param (
        [Parameter()][System.Management.Automation.PSCredential]$Credential,
        [Parameter(ValueFromPipeline = $True, Mandatory = $true)][String]$Command,
        [Parameter(ValueFromPipeline = $True, Mandatory = $False)][String]$Arguments
    )

    if (-not($Credential))
    {
        $Credential = Get-Credential
    }

    switch ($Credential.UserName) 
    {
        { $_ -match "\\" } { $Domain , $Username = $Credential.UserName -split "\\" }
        { $_ -match "@" } { $Username , $Domain = $Credential.UserName -split "@" }
        Default { $Domain = $env:USERDOMAIN ; $Username = $Credential.UserName }
    }

    $StartInfo = new-object System.Diagnostics.ProcessStartInfo
    $StartInfo.UserName = $Username
    $StartInfo.Password = $Credential.Password
    $StartInfo.Domain = $Domain
    $StartInfo.FileName = $Command
    $StartInfo.Arguments = $Arguments
    $StartInfo.CreateNoWindow = $false
    $StartInfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::hidden
    $StartInfo.UseShellExecute = $false
    [System.Diagnostics.Process]::Start($StartInfo) | Out-Null
        
}

New-Alias -Name RunASPS -Value Invoke-RunAS -ErrorAction SilentlyContinue