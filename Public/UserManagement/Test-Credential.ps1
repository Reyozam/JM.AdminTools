function Test-Credential
{
<#
.SYNOPSIS
    Test local or AD credential on remote computer
.DESCRIPTION
    Test local or AD credential on remote computer
.EXAMPLE
    $Credential = Get-Credential
    test-credential -credential  -domain contoso.com
    Test-Credential -credential -computername server01
#> 

    [cmdletbinding(DefaultParameterSetName = 'Domain')]
    param(
        [parameter(ValueFromPipeline = $true)]
        [System.Management.Automation.PSCredential]$Credential = $( Get-Credential -Message "Please provide credentials to test" ),

        [validateset('Domain', 'Machine', 'ApplicationDirectory')]
        [string]$Context = 'Domain',

        [parameter(ParameterSetName = 'Machine')]
        [string]$ComputerName,

        [parameter(ParameterSetName = 'Domain')]
        [string]$Domain = $null
    )
    Begin
    {
        Write-Verbose "ParameterSetName: $($PSCmdlet.ParameterSetName)`nPSBoundParameters: $($PSBoundParameters | Out-String)"
        Try
        {
            Add-Type -AssemblyName System.DirectoryServices.AccountManagement
        }
        Catch
        {
            Throw "Could not load assembly: $_"
        }

        if ($Context -eq 'ApplicationDirectory' )
        {

            $DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::$Context)
        }
        elseif ($PSCmdlet.ParameterSetName -eq 'Domain')
        {
            $Context = $PSCmdlet.ParameterSetName
            $DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::$Context, $Domain)
        }
        elseif ($PSCmdlet.ParameterSetName -eq 'Machine')
        {
            $Context = $PSCmdlet.ParameterSetName
            $DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::$Context, $ComputerName)
        }

    }
    Process
    {
        #Validate provided credential
        $DS.ValidateCredentials($Credential.UserName, $Credential.GetNetworkCredential().password)
    }
    End
    {
        $DS.Dispose()
    }
}