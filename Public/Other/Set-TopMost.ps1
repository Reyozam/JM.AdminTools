###############################################################################################################
# Language     :  PowerShell 5.0
# Filename     :  Set-TopMost.ps1
# Autor        :  Julien Mazoyer
# Description  :  Set/Unset Current Powershell Console always on Top  
###############################################################################################################

<#
    .SYNOPSIS
    Make Current Powershell Console always on Top  

    .DESCRIPTION
    Make Current Powershell Console always on Top  
#>
function Set-TopMost
{
    param(		
        [Parameter()][switch]$Disable
    )
    $signature = @"
	
	[DllImport("user32.dll")]  
	public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);  

	public static IntPtr FindWindow(string windowName){
		return FindWindow(null,windowName);
	}

	[DllImport("user32.dll")]
	public static extern bool SetWindowPos(IntPtr hWnd, 
	IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);

	[DllImport("user32.dll")]  
	public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow); 

	static readonly IntPtr HWND_TOPMOST = new IntPtr(-1);
	static readonly IntPtr HWND_NOTOPMOST = new IntPtr(-2);

	const UInt32 SWP_NOSIZE = 0x0001;
	const UInt32 SWP_NOMOVE = 0x0002;

	const UInt32 TOPMOST_FLAGS = SWP_NOMOVE | SWP_NOSIZE;

	public static void MakeTopMost (IntPtr fHandle)
	{
		SetWindowPos(fHandle, HWND_TOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS);
	}

	public static void MakeNormal (IntPtr fHandle)
	{
		SetWindowPos(fHandle, HWND_NOTOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS);
	}
"@


    $app = Add-Type -MemberDefinition $signature -Name Win32Window -Namespace ScriptFanatic.WinAPI -ReferencedAssemblies System.Windows.Forms -Using System.Windows.Forms -PassThru
    
    $Handle = (Get-Process -id $PID).MainWindowHandle 
	
    if ($Handle -ne 0)
    {
        if ($Disable)
        {
            Write-Verbose "[ALWAYS ON TOP] Disable" -Verbose
            $null = $app::MakeNormal($Handle)
            return
        }
		
        Write-Verbose "[ALWAYS ON TOP] Enable" -Verbose
        $null = $app::MakeTopMost($Handle)
    }
}
