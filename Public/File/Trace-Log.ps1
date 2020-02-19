function Trace-Log 
{
<#
.SYNOPSIS
    Read log and highlight Success/Warning/Error
.DESCRIPTION
    Read log and highlight Success/Warning/Error
.PARAMETER LogPath
    Log Path
.PARAMETER Wait
    Wait from new entries in log file. Cancel with CTRL+C
.EXAMPLE
    Trace-Log -LogPath C:\temp\log.log -Wait
#>
    param (
        #
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, Position=0)][string]$LogPath,
        [switch]$Wait
    )

    $WarningPattern = "Attention|Warning|Warn"
    $ErrorPattern = "Error|Failed|Erreur"
    $SuccessPattern = "Success"
    
    if (Test-Path $LogPath)
    {
        if ($Wait)
        {
            do
            {
                Get-Content $LogPath -Wait -Tail 15 | ForEach-Object {

                    switch ($_) 
                    {
                        { $_ -match $ErrorPattern } { Write-Host $_ -BackgroundColor Red -ForegroundColor ($host.ui.RawUI.BackgroundColor) }
                        { $_ -match $WarningPattern } { Write-Host $_ -BackgroundColor DarkYellow -ForegroundColor ($host.ui.RawUI.BackgroundColor) }
                        { $_ -match $SuccessPattern } { Write-Host $_ -BackgroundColor Green -ForegroundColor ($host.ui.RawUI.BackgroundColor) }
                        default { Write-Host $_ }
                    }
                }
            } until ($true)
        }
        else
        {
            Get-Content $LogPath | ForEach-Object {

                switch ($_) 
                {
                    { $_ -match $ErrorPattern } { Write-Host $_ -BackgroundColor Red -ForegroundColor ($host.ui.RawUI.BackgroundColor) }
                    { $_ -match $WarningPattern } { Write-Host $_ -BackgroundColor DarkYellow -ForegroundColor ($host.ui.RawUI.BackgroundColor) }
                    default { Write-Host $_ }
                }
            
        

            }
        }
        


    }
    else
    {
        throw "File not found !"
    }
}