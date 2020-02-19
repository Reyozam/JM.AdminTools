Function Get-WebFile
{
    <#
.SYNOPSIS
    DownloadFile from a URL
.DESCRIPTION
    DownloadFile from a URL
.PARAMETER Source
    File URL
.PARAMETER DownloadPath
    File Destination
.EXAMPLE
    Get-WebFile https:\\donwload.fr\file.zip
#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Uri]$Source,
        [Parameter()]
        [System.String]$DownloadPath = $Pwd.path

    )

    $FileName = Split-Path $Source.AbsolutePath -Leaf
    $Destination = Join-Path $DownloadPath $FileName
    $webclient = New-Object System.Net.WebClient
    $webclient.DownloadFile($Source, $Destination)

}