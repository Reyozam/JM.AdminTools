function Test-Ping
{
  <#
    .SYNOPSIS
    Sends a ping (ICMP) to a computer
    .DESCRIPTION
    Sends a ping (ICMP) to a computer
    .EXAMPLE
    Test-Ping -ComputerName 127.0.0.1, microsoft.com, powershell.one -Timeout 2000
    Pings three computers with a maximum timeout of 2000 milliseconds
    .EXAMPLE
    '127.0.0.1', 'microsoft.com', 'powershell.one' | Test-Ping -Timeout 2000 
    Pings three computers with a maximum timeout of 2000 milliseconds
    .EXAMPLE
    Get-ADComputer -Filter * | Select-Object -ExpandProperty Name | Test-Ping -Timeout 2000
    Pings all computers received from Get-ADComputer with a maximum timeout of 2000 milliseconds
    Module "ActiveDirectory" required for Get-ADComputer
  #>


  param
  (
    # Computername or IP address to ping
    [Parameter(Mandatory,ValueFromPipeline)]
    [string[]]
    $ComputerName,
    
    # Timeout in milliseconds
    [int]
    [ValidateRange(100,50000)]
    $Timeout = 2000
  )
  
  begin
  {
    $Online = @{
      Name = 'Online'
      Expression = { $_.Status -eq 'Success' }
    }
    $obj = New-Object System.Net.NetworkInformation.Ping
  }
  
  process
  {
    $ComputerName | 
    ForEach-Object {
      $obj.Send($_, $timeout) |
      Select-Object -Property $Online, Status, Address |
      Add-Member -MemberType NoteProperty -Name Name -Value $_ -PassThru
    }
  }
}