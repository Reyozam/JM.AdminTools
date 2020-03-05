function Get-ComputerUptime
{
<#
.SYNOPSIS
    Get computer uptime
.DESCRIPTION
    Get computer uptime
.PARAMETER ComputerName
    Targtet computer
.EXAMPLE
    Get-ComputerUptime -computername Server01
#> 
    [CmdletBinding()]
    param (
        
        [Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias("Name")]
        [string]$ComputerName,
        [Parameter()][ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )
    
    begin 
    {
        if ($PSBoundParameters.ContainsKey("Credential"))
        {
            $PSDefaultParameterValues = @{"New-CimSession:Credential" = $Credential }
        }
    }
    
    process 
    {
 
        try 
        {
            if ($ComputerName)
            {
                Write-Verbose "[$(Get-Date -format G)] Look for $computer uptime "
                $CIMSession = New-CimSession -ComputerName $ComputerName 
                $UpTime = (Get-CimInstance -ClassName Win32_OperatingSystem -Property LastBootUpTime -CimSession $CIMSession).LastBootUpTime
                Remove-CimSession -CimSession $CIMSession
            }
            else
            {
                $UpTime = (Get-CimInstance -ClassName Win32_OperatingSystem -Property LastBootUpTime).LastBootUpTime
            }
               
            [PSCustomObject]@{
                LastReboot = $UpTime
                TimeSpan   = (New-TimeSpan -Start $UpTime -End ([datetime]::now)) -f "g"
            }

        }
        catch 
        {
            Write-Error $_
        }
    }
    end
    {
    }
    
        
}
    


    


