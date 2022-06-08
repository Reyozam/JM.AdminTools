
Function Start-PingView
{
    <#
    .SYNOPSIS
    Monitoring ping on multiple target

    .DESCRIPTION
    Monitoring ping on multiple target

    .EXAMPLE
    PS C:\> Start-PingView  -hosts computer01,computer02

    .EXAMPLE
    PS C:\> Get-ADComputer -filter {name -like "*DC*"} | Start-PingView

#>
    Param
    (
        [Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $true)]
        [Alias("Name", "ComputerName", "Computer")]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string[]]$Hosts,
        [int]$RefreshTime = 5
    )

    Get-Job PING* | Remove-Job
    
    $ScriptBlock = {
        param ($Target)

        $Result = Test-Connection $Target -Count 1 -ErrorAction SilentlyContinue

        [PSCustomObject]@{
            Target = $Target.ToUpper()
            Result = if ($result)
            {
                $true
            }
            else
            {
                $false
            }
            RTT    = if ($PSVersionTable.PSVersion.Major -eq 7 ) { $Result.Latency } else { $Result.ResponseTime } #Change in v7 on object properties
        }
    }
    
    $MaxTargetNameLength = ($hosts | Sort-Object -Property length -Descending)[0].length
    $RunNB = 0
    while ($true)
    {
        Get-Job PING* | Remove-Job

        $Jobs = foreach ($Target in $Hosts) 
        {
            Start-Job -ScriptBlock $ScriptBlock -Name $("PING_$Target") -ArgumentList $Target
        }
        
        
        $RunNB ++
        $JobsReturn = $null
        $JobsReturn = $Jobs | Wait-Job | Receive-Job 
        
        Clear-Host
        Write-Host " PING STATUS FOR $($Hosts.Count) TARGETS - Run $RunNB times - [Refresh in $RefreshTime seconds] " -ForegroundColor Black -BackgroundColor White
        Write-Host ""

        $JobsReturn | ForEach-Object {
            
            if ($env:WT_SESSION)
            {

                if ($_.Result -eq $true) 
                { 
                    Write-Host "🟢" -NoNewline
                    Write-Host $("`t{0,-$MaxTargetNameLength} [{1}ms]" -f $_.Target, $_.RTT) -ForegroundColor Green
                }
                else
                {
                    Write-Host "🔴" -NoNewline
                    Write-Host $("`t{0,-$MaxTargetNameLength}" -f $_.Target) -ForegroundColor Red
                }
            }
            else
            {
                if ($_.Result -eq $true) 
                { 
                    Write-Host "[ UP ]" -NoNewline -BackgroundColor Green -ForegroundColor Black
                    Write-Host $("`t{0,-$MaxTargetNameLength} [{1}ms]" -f $_.Target, $_.RTT) -ForegroundColor Green
                }
                else
                {
                    Write-Host "[DOWN]" -NoNewline -BackgroundColor Red -ForegroundColor Black
                    Write-Host $("`t{0,-$MaxTargetNameLength}" -f $_.Target) -ForegroundColor Red
                }
            }
        }

        Start-Sleep -Seconds $RefreshTime

        
    }

}
