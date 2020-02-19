function Watch-Service
{
<#
.SYNOPSIS
    Watch a service and restart it if it stops
.DESCRIPTION
    Watch a service and restart it if it stops
.PARAMETER  ServiceName
    Service name
.EXAMPLE
    Watch-Service -ServiceName wuaserv
#> 
    [CmdletBinding()]
    param (
        
        [Parameter(Mandatory)]
        [string]
        $ServiceName,

        [Parameter()]
        [int]
        $TimeLapse = 5
    )
    
  
    try 
    {
        $SVC = Get-Service $ServiceName -ErrorAction Stop    
    }
    catch 
    {
        throw "Service `"$ServiceName`" does not exist"
    }
        
    Write-Verbose "[$(Get-Date -f "g")] Watching service $serviceName..." -Verbose

    do
    {
        Start-Sleep $TimeLapse

        if (Get-Service $SVC.Name | Where-Object {$_.Status -eq "Stopped"})
        {
            Write-Warning "[$(Get-Date -f "g")] Service $serviceName has stopped !" -Verbose
            Write-Verbose "[$(Get-Date -f "g")] Restarting service $serviceName..." -Verbose

            try 
            {
                Get-Service $SVC.Name | Start-Service -ErrorAction Stop
            }
            catch 
            {
                Write-Error "Unable to restart the service"
            }
            
        }
        else
        {
            Write-Verbose "[$(Get-Date -f "g")] Service $serviceName is running..." -Verbose 
        }

        
        
    } while ($true)
    

    

    
}