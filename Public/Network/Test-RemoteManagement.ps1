function Test-RemoteManagement
{
<#
.SYNOPSIS
    Test remote management capabilities of a target computer
.DESCRIPTION
    Test remote management capabilities of a target computer
.PARAMETER ComputerName
    Target computer
.PARAMETER Protocol
	Protocol(s) to test
.PARAMETER Protocol
    TCP/UDP
.EXAMPLE
    Test-RemoteManagement -computername Server01,Server02 -Protocol WMI,WinRM
#>
    [cmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [Alias('Name', 'Target')]
        [string[]]
        $Computername,

        [Parameter(Position = 1)]
        [ValidateSet("WMI", "WinRM")]
        [string[]]$Protocol = @("WMI", "WinRM")
    )
    process
    {
        $Output = foreach ($Computer in $ComputerName)
        {
            
            $OutputObj = [ordered]@{
                Computer = $Computer
            }
            
            $PingParams = @{
                'Computername' = $Computer
                'Count'        = 1
                'Quiet'        = $true
            }
                

            $OutputObj.Add("Ping", (Test-Connection @PingParams))
            
            if ($Protocol -contains "WMI")
            {
                $WMIParams = @{
                    'ComputerName' = $Computer
                    'ClassName'    = 'Win32_Bios'
                }

                try 
                {
                    $OutputObj.Add('WMI', [bool](Get-WmiObject @WMIParams -ErrorAction Stop))
                }
                catch
                {
                    $OutputObj.Add('WMI', $_.Exception.Message)
                }
            }

            if ($Protocol -contains "WinRM")
            {
                try 
                {

                    $OutputObj.Add('WinRM', [bool]($null = Invoke-Command -ComputerName $Computer -ScriptBlock {ipconfig} -ErrorAction Stop ))
                }
                catch
                {
                    $OutputObj.Add('WinRM', $_.Exception.Message)
                }

            }
            
            [PSCustomObject]$OutputObj
        }

        return $Output
    }
}