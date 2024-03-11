function Start-ProcessQuiet
{
<#
.SYNOPSIS
    Start a process in background
.DESCRIPTION
    Start a process in background and return output
.PARAMETER FilePath
    Executable
.PARAMETER arguments
	Executable arguments

.EXAMPLE
    Start-ProcessQuiet -Filepath "cmd" -argument "/c ipconfig"
#>
    [CmdletBinding()]
    Param
    (

        [Parameter(Mandatory = $true)]
        [string]
        $FilePath,
        # Argument List for Process
        [Parameter(Mandatory = $false)]
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