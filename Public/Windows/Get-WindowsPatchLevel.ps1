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
        [System.Management.Automation.PSCredential]$Credential
    )

    begin
    {
    }

    process
    {

        $RemoteParam = @{}

        [scriptblock]$ScriptBlock = {

            $ProductName = Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty Caption
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

        if ($Credential )
        {
            $RemoteParam['Credential'] = $Credential
        }

        if ($Computername )
        {
            $RemoteParam['ComputerName'] = $Computername
            $RemoteParam['HideComputerName'] = $true

            Write-Verbose "Query $Computername ..."
            Invoke-Command -ScriptBlock $ScriptBlock @RemoteParam | Select-Object -ExcludeProperty RunspaceID
        }
        else
        {
            Write-Verbose "Query Localhost ..."
            Invoke-Command -ScriptBlock $ScriptBlock  | Select-Object -ExcludeProperty RunspaceID

        }

    }

    end {
        Write-Verbose "End Process"
    }

}

