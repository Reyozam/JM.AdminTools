function Get-ComputerUptime
{
    [CmdletBinding()]
    param (
        
        [Parameter(Mandatory = $true,
            Position = 1,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias("Name")]
        [string[]]$Computers,
        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )
    
    begin 
    {
        if ($PSBoundParameters.ContainsKey("Credential"))
        {
            $PSDefaultParameterValues = @{"Get-WmiObject:Credential" = $Credential }
        }
    }
    
    process 
    {
        foreach ($Computer in $Computers)
        {
            
            try 
            {
                Write-Verbose "[$(Get-Date -format G)] Look for $computer uptime "
                $UpTime = [Management.ManagementDateTimeConverter]::ToDateTime((Get-WmiObject Win32_OperatingSystem -ComputerName $Computer -ErrorAction Stop).LastBootUpTime)

                [PSCustomObject]@{
                    LastReboot = $UpTime
                    TimeSpan   = (New-TimeSpan -Start $UpTime -End ([datetime]::now)) -f "g"
                }


            }
            catch 
            {
                Write-Error "Unable to join $Computer"
            }
        }
        
    }
    
    end
    {
    }
    

    

}
