function Test-Port
{
<#
.SYNOPSIS
    Test port status on remote computer
.DESCRIPTION
    Test port status on remote computer
.PARAMETER ComputerName
    Target computer
.PARAMETER Port
	Port(s) to test
.PARAMETER Protocol
    TCP/UDP
.EXAMPLE
    Test-Port -computername Server01,Server02 -Port 80,443
#>

	[CmdletBinding(DefaultParameterSetName = 'TCP')]
	[OutputType([System.Management.Automation.PSCustomObject])]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string[]]$ComputerName,
		[Parameter(Mandatory = $true, Position = 1)]
		[int[]]$Port,
		[Parameter(Mandatory = $false)]
		[ValidateSet('TCP', 'UDP')]
		[string]$Protocol = "TCP",
		[Parameter(ParameterSetName = 'TCP')]
		[int]$TcpTimeout = 1000,
		[Parameter(ParameterSetName = 'UDP')]
		[int]$UdpTimeout = 1000
	)
	process
 {
		foreach ($Computer in $ComputerName)
		{
			foreach ($Portx in $Port)
			{
				$Output = [ordered]@{ 'Computername' = $Computer; 'Port' = $Portx; 'Protocol' = $Protocol; 'Result' = '' }
				Write-Verbose "$($MyInvocation.MyCommand.Name) - Beginning port test on '$Computer' on port '$Protocol : $Portx'"
				if ($Protocol -eq 'TCP')
				{
					$TcpClient = New-Object System.Net.Sockets.TcpClient
					$Connect = $TcpClient.BeginConnect($Computer, $Portx, $null, $null)
					$Wait = $Connect.AsyncWaitHandle.WaitOne($TcpTimeout, $false)
					if (!$Wait)
					{
						$TcpClient.Close()
						Write-Verbose "$($MyInvocation.MyCommand.Name) - '$Computer' failed port test on port '$Protocol : $Portx'"
						$Output.Result = $false
					}
					else
					{
						$TcpClient.EndConnect($Connect)
						$TcpClient.Close()
						Write-Verbose "$($MyInvocation.MyCommand.Name) - '$Computer' passed port test on port '$Protocol<code>:$Portx'"
						$Output.Result = $true
					}
					$TcpClient.Close()
					$TcpClient.Dispose()
				}
				elseif ($Protocol -eq 'UDP')
				{
					$UdpClient = New-Object System.Net.Sockets.UdpClient
					$UdpClient.Client.ReceiveTimeout = $UdpTimeout
					$UdpClient.Connect($Computer, $Portx)
					Write-Verbose "$($MyInvocation.MyCommand.Name) - Sending UDP message to computer '$Computer' on port '$Portx'"
					$a = new-object system.text.asciiencoding
					$byte = $a.GetBytes("$(Get-Date)")
					[void]$UdpClient.Send($byte, $byte.length)
					
					Write-Verbose "$($MyInvocation.MyCommand.Name) - Creating remote endpoint"
					$remoteendpoint = New-Object system.net.ipendpoint([system.net.ipaddress]::Any, 0)
					try
					{
						
						Write-Verbose "$($MyInvocation.MyCommand.Name) - Waiting for message return"
						$receivebytes = $UdpClient.Receive([ref]$remoteendpoint)
						[string]$returndata = $a.GetString($receivebytes)
						If ($returndata)
						{
							Write-Verbose "$($MyInvocation.MyCommand.Name) - '$Computer' passed port test on port '$Protocol</code>:$Portx'"
							$Output.Result = $true
						}
					}
					catch
					{
						Write-Verbose "$($MyInvocation.MyCommand.Name) - '$Computer' failed port test on port '$Protocol`:$Portx' with error '$($_.Exception.Message)'"
						$Output.Result = $false
					}
					$UdpClient.Close()
					$UdpClient.Dispose()
				}
				[pscustomobject]$Output
			}
		}
	}
}