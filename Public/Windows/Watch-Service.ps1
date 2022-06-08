function Watch-Service
{
    [CmdletBinding()]
    param (
        
        [Parameter(Mandatory)]
        [string]
        $ServiceName,

        [Parameter()]
        [switch]
        $NoServiceRestart,

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

        if (Get-Service $SVC.Name | Where-Object { $_.Status -eq "Stopped" })
        {

            if ($NoServiceRestart)
            { 

                Write-Warning "[$(Get-Date -f "g")] Service $serviceName has stopped !" -Verbose
                Write-Verbose "[$(Get-Date -f "g")] [No restart mode] Service $serviceName... will not be restarted " -Verbose
            }
            else
            {
                Write-Warning "[$(Get-Date -f "g")] Service $serviceName has stopped !" -Verbose
                Write-Verbose "[$(Get-Date -f "g")] Attempting to restart Service $serviceName..." -Verbose

                try 
                {
                    Get-Service $SVC.Name | Start-Service -ErrorAction Stop 
                }
                catch 
                {
                    Write-Error "Unable to restart the service (Run As Admin ?)"
                }
            }
            
        }
        else
        {
            Write-Verbose "[$(Get-Date -f "g")] Service $serviceName is running..." -Verbose 
        }

    }  while ($true)
            
}