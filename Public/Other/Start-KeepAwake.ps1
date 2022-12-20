function Start-KeepAwake {
    [CmdletBinding()]
    param (
        [int]$Minutes
    )

    if ($null -ne $Minutes)
    {
        Write-Verbose "Keep Awake for $Minutes minutes ..." -Verbose
        $timeSpan = New-TimeSpan -Minutes $Minutes
        $stopWatch = New-Object -TypeName System.Diagnostics.Stopwatch

        $wsh = New-Object -ComObject WScript.Shell
        while ($stopWatch.Elapsed -le $timeSpan)
        {
          $wsh.SendKeys('+{F15}')
          Start-Sleep -seconds 59

          $Remain = $TimeSpan - $stopWatch.Elapsed

          Write-Vebose ("{0}m:{1}s remaining..." -f $Remain.Minutes,$Remain.Seconds) -Verbose

        }
    }
    else
    {
        Write-Verbose "Keep Awake until manually stop !" -Verbose
        $wsh = New-Object -ComObject WScript.Shell
        while ($true)
        {
          $wsh.SendKeys('+{F15}')
          Start-Sleep -seconds 59

          $Remain = $TimeSpan - $stopWatch.Elapsed

        }
    }
}