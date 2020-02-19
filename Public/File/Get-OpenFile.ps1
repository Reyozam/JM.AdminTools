function Get-OpenFile
{
<#
.SYNOPSIS
    Get open file on a computer
.DESCRIPTION
    Get open file on a computer
.PARAMETER ComputerName
    Target computer
.PARAMETER FileName
    Look for specific file
.EXAMPLE
    Get-OpenFile -computername Computer01
.EXAMPLE
    Get-OpenFile -computername Computer01 -filename doc01.docx
#>
    [CmdletBinding()]
    param (
        [Parameter (Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)]
        [Alias('Hostname', 'DNSHostName')]
        [string[]]$ComputerName,
    
        [Parameter(Mandatory = $false,
            Position = 1)]
        [string]$FileName
    )
    Process
    {
        foreach ($Computer in $Computername)
        {
            try
            {
                $Files = $Files = openfiles.exe /query /s $ComputerName /fo csv /V | ConvertFrom-Csv -ErrorAction Stop
                foreach ($File in $Files)
                {
                    $File | Where-Object { $PSItem.'Open File (Path\executable)' -like $FileName }
                }
            }
            catch
            {
                Write-Warning "Error getting open files."
            }
        }
    }
}