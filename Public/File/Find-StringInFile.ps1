function Find-StringInFile
{
<#
.SYNOPSIS
    Search for a string in files from a path
.DESCRIPTION
    Search for a string in files from a path
.PARAMETER search
    String to search
.PARAMETER Path
    Folder where to look for
.EXAMPLE
    Find-StringInFile -search "string" -path C:\users\
.NOTES
    Fork from https://github.com/BornToBeRoot
#>

    [CmdletBinding()]
    param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "String to find")]
        [String]$Search,

        [Parameter(
            Position = 1,
            HelpMessage = "Folder where the files are stored (search is recursive)")]
        [ValidateScript( {
                if (Test-Path -Path $_)
                {
                    return $true
                }
                else
                {
                    throw "Enter a valid path!"
                }
            })]
        [String]$Path = (Get-Location),

        [Parameter(
            Position = 2,
            HelpMessage = "String must be case sensitive (Default=false)")]
        [switch]$CaseSensitive = $false
    )

    Begin
    {

    }

    Process
    {
        # Files with string to find
        $Strings = Get-ChildItem -Path $Path -Recurse | Select-String -Pattern ([regex]::Escape($Search)) -CaseSensitive:$CaseSensitive | Group-Object -Property Path

        # Go through each file
        foreach ($String in $Strings)
        {

            # Go through each group
            foreach ($Group in $String.Group)
            {
                [pscustomobject] @{
                    Filename   = $Group.Filename
                    Path       = $Group.Path
                    LineNumber = $Group.LineNumber
                    Matches    = $Group.Matches
                }
            }
        }
    }

    End
    {

    }
}