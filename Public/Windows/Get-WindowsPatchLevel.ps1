Function Get-WindowsPatchLevel
{

    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('Name', 'Hostname')]
        [ValidateScript({ Test-Connection -ComputerName $_ -Quiet -Count 1 })]
        [string[]]
        $Computername,

        # Specifies the user account credentials to use when performing this task.
        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    begin
    {
    }

    process
    {
        Write-Verbose "Query $Computername ..."
        $RemoteParam = @{}

        if ($Computername )
        {
            $RemoteParam['ComputerName'] = $Computername
            $RemoteParam['HideComputerName'] = $true
        }

        if ($Credential )
        {
            $RemoteParam['Credential'] = $Credential
        }

        [scriptblock]$ScriptBlock = {

            $ProductName = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' –Name ProductName).ProductName
            $Version = Try { (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' –Name ReleaseID –ErrorAction Stop).ReleaseID } Catch { 'N/A' }
            $CurrentBuild = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' –Name CurrentBuild).CurrentBuild
            $UBR = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' –Name UBR).UBR


            [PSCustomObject]@{
                ComputerName        = $env:computername
                ProductName         = $ProductName
                Version             = $Version
                CurrentBuild        = $CurrentBuild
                UpdateBuildRevision = $UBR
                OSVersion           = $CurrentBuild + '.' + $UBR
            }

        }

        Invoke-Command -ScriptBlock $ScriptBlock @RemoteParam | Select-Object -ExcludeProperty RunspaceID
    }

    end {
        Write-Verbose "End Process"
    }

}

