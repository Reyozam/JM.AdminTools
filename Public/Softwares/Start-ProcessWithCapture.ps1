###############################################################################################################
# Language     :  PowerShell 4.0
# Filename     :  Start-ProcessWithCapture.ps1
# Autor        :  Julien Mazoyer
# Description  :  Start processes and capturing output.
###############################################################################################################

<#
.Synopsis
   Start processes and capturing output.
.DESCRIPTION
   Start processes and capturing output.
.EXAMPLE
   $Return = Start-ProcessWithCapture -FilePath 'ping' -ArgumentList "google.fr"

   Name                           Value
   ----                           -----
   stdout                         ...
   exitcode                       0
   stderr

   $Return.stdout

   Envoi d'une requête 'ping' sur google.fr [2a00:1450:4007:810::2003] avec 32 octets de données :
    Réponse de 2a00:1450:4007:810::2003 : temps=2 ms
    Réponse de 2a00:1450:4007:810::2003 : temps=2 ms
    ...
#>
function Start-ProcessWithCapture
{
    [CmdletBinding()]
    Param
    (

        [Parameter(Mandatory = $true)]
        [string]
        $FilePath,
        # Argument List for Process
        [Parameter(Mandatory = $true)]
        [string]
        $ArgumentList,
        # Argument List for Process
        [Parameter(Mandatory = $false)]
        [string]
        $WorkingDirectory = $pwd.path
    )
    
    $ProcessInfo = New-Object System.Diagnostics.ProcessStartInfo
    $ProcessInfo.WorkingDirectory = $WorkingDirectory
    $ProcessInfo.FileName = $FilePath
    $ProcessInfo.RedirectStandardError = $true
    $ProcessInfo.RedirectStandardOutput = $true
    $ProcessInfo.UseShellExecute = $false
    $ProcessInfo.Arguments = $ArgumentList
    $Process = New-Object System.Diagnostics.Process
    $Process.StartInfo = $ProcessInfo
    $Process.Start() | Out-Null
    $Process.WaitForExit()
    $stdout = $Process.StandardOutput.ReadToEnd()
    $stderr = $Process.StandardError.ReadToEnd()
    $output = @{}
    $output.stdout = $stdout
    $output.stderr = $stderr
    $output.exitcode = $Process.ExitCode
    return $output
}