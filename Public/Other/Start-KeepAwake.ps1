function Start-KeepAwake
{
  [CmdletBinding()]
  param (
    [int]$Minutes
  )

  if ($Minutes -ne 0)
  {
    Write-Verbose "Keep Awake for $Minutes minutes ..." -Verbose
    $timeSpan = New-TimeSpan -Minutes $Minutes
    $stopWatch = New-Object -TypeName System.Diagnostics.Stopwatch
    $stopWatch.Start()

    $wsh = New-Object -ComObject WScript.Shell
    do
    {
      $Remain = $TimeSpan - $stopWatch.Elapsed
      Write-Verbose ('{0}m:{1}s remaining...' -f $Remain.Minutes, $Remain.Seconds) -Verbose

      $wsh.SendKeys('+{F15}')

      Start-Sleep -Seconds 60

    } while ( $stopWatch.Elapsed -lt $timeSpan)
  }
  else
  {
    Write-Verbose 'Keep Awake until manually stop !' -Verbose
    $wsh = New-Object -ComObject WScript.Shell
    while ($true)
    {
      $wsh.SendKeys('+{F15}')
      Start-Sleep -Seconds 59

      $Remain = $TimeSpan - $stopWatch.Elapsed

    }
  }
}

