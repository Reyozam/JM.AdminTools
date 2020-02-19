function Sync-Folder
{
<#
.SYNOPSIS
    Sync two folder
.DESCRIPTION
    Sync two folder via Robocopy
.PARAMETER Source
    Source Folder
.PARAMETER Destination
    Destination folder
.EXAMPLE
    Sync-Folder -source C:\Folder01 -destination C:\Folder02
#>
	[CmdletBinding()]
	param (
		
		[Parameter(Mandatory)][string]$Source,
		[Parameter(Mandatory)][string]$Destination
	)
	
	$RobocopyParams = $Source, $Destination, '/MIR', '/FFT', '/NDL', '/NP', '/NS'

	Robocopy.exe $RobocopyParams

	if ($LastExitCode -gt 3) { throw 'Robocopy failed.' }

}