
function Start-PortScan
{
<#
    .SYNOPSIS
    Start a port scan on the selected computer.

    .DESCRIPTION
    Start a port scan on the selected computer on common TCP Ports

    .EXAMPLE
    PS C:\> Start-PortScan -computername Server01

	Service : FTP Data
	Port    : 20
	Status  : Open

	Service : FTP Command
	Port    : 21
	Status  : Closed

	Service : SSH
	Port    : 22
	Status  : Closed

	Service : TelNet
	Port    : 23
	Status  : Closed

	...
#>
	
	[CmdletBinding()]
	[OutputType([System.Management.Automation.PSCustomObject[]])]
	Param(
		[Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]$ComputerName = "localhost"
	)

	Begin
	{
		$script:Ports = @(
			[PSCustomObject]@{"Service" = "FTP Data"; "Port" = 20 },
			[PSCustomObject]@{"Service" = "FTP Command"; "Port" = 21 },
			[PSCustomObject]@{"Service" = "SSH"; "Port" = 22 },
			[PSCustomObject]@{"Service" = "TelNet"; "Port" = 23 },
			[PSCustomObject]@{"Service" = "SMTP"; "Port" = 25 },
			[PSCustomObject]@{"Service" = "WINS"; "Port" = 42 },
			[PSCustomObject]@{"Service" = "DNS"; "Port" = 53 },
			[PSCustomObject]@{"Service" = "DHCP Server"; "Port" = 67 },
			[PSCustomObject]@{"Service" = "DHCP Client"; "Port" = 68 },
			[PSCustomObject]@{"Service" = "TFTP"; "Port" = 69 },
			[PSCustomObject]@{"Service" = "HTTP"; "Port" = 80 },
			[PSCustomObject]@{"Service" = "Kerberos"; "Port" = 88 },
			[PSCustomObject]@{"Service" = "POP3"; "Port" = 110 },
			[PSCustomObject]@{"Service" = "SFTP"; "Port" = 115 },
			[PSCustomObject]@{"Service" = "NetBIOS Name Service"; "Port" = 137 },
			[PSCustomObject]@{"Service" = "NetBIOS Datagram Service"; "Port" = 138 },
			[PSCustomObject]@{"Service" = "NetBIOS Session Service"; "Port" = 139 },
			[PSCustomObject]@{"Service" = "SNMP"; "Port" = 161 },
			[PSCustomObject]@{"Service" = "LDAP"; "Port" = 389 },
			[PSCustomObject]@{"Service" = "HTTPS"; "Port" = 443 },
			[PSCustomObject]@{"Service" = "SMB"; "Port" = 445 },
			[PSCustomObject]@{"Service" = "Syslog"; "Port" = 514 },
			[PSCustomObject]@{"Service" = "RPC"; "Port" = 135 },
			[PSCustomObject]@{"Service" = "LDAPS"; "Port" = 636 },
			[PSCustomObject]@{"Service" = "SOCKS"; "Port" = 1080 },
			[PSCustomObject]@{"Service" = "MSSQL"; "Port" = 1433 },
			[PSCustomObject]@{"Service" = "SQL Browser"; "Port" = 1434 },
			[PSCustomObject]@{"Service" = "Oracle DB"; "Port" = 1521 },
			[PSCustomObject]@{"Service" = "NFS"; "Port" = 2049 },
			[PSCustomObject]@{"Service" = "RDP"; "Port" = 3389 },
			[PSCustomObject]@{"Service" = "XMPP"; "Port" = 5222 },
			[PSCustomObject]@{"Service" = "HTTP Proxy"; "Port" = 8080 },
			[PSCustomObject]@{"Service" = "Global Catalog"; "Port" = 3268 },
			[PSCustomObject]@{"Service" = "Global Catalog/SSL"; "Port" = 3269 },
			[PSCustomObject]@{"Service" = "POP3/SSL"; "Port" = 995 },
			[PSCustomObject]@{"Service" = "IMAP/SSL"; "Port" = 993 },
			[PSCustomObject]@{"Service" = "IMAP"; "Port" = 143 }
		)
	}

	Process
	{
		$Result = foreach ($Port in $Ports)
		{
			Write-Progress -Activity "Running Port Scan on [$ComputerName]" -Status "Scanning Port $($Port.Port) $($Port.Service)" -PercentComplete (($i++ / $Ports.Count) * 100)

			$Socket = New-Object Net.Sockets.TcpClient
			$ErrorActionPreference = 'SilentlyContinue'
			$Socket.Connect($ComputerName, $Port.Port)
			$ErrorActionPreference = 'Continue'

			if ($Socket.Connected)
			{
				$Socket.Close()
				[PSCustomObject]@{
					"Service" = $Port.Service
					"Port"    = $Port.Port
					"Status"  = "Open" 
				}
			}
			else
			{
				[PSCustomObject]@{
					"Service" = $Port.Service
					"Port"    = $Port.Port
					"Status"  = "Closed" 
				}
			}
			
		}

		
	}

	End
	{
		return $Result | Sort-Object Status -Descending
	}
}
