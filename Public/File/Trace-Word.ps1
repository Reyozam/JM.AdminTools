
Function Trace-Word
{
<#
.SYNOPSIS
    Look and highligh from words in a file content
.DESCRIPTION
    Look and highligh from words in a file content
.PARAMETER Content
    Content
.PARAMETER words
    words to look for
.EXAMPLE
    Get-Content file.txt | Trace-Word -words "Computer01","Server02"
#>
    [Cmdletbinding()]
    [Alias("Highlight")]
    Param(
            [Parameter(ValueFromPipeline=$true, Position=0)] [string[]]$Content,
            [Parameter(Position=1)] 
            [ValidateNotNull()]
            [String[]] $words = $(throw "Provide word[s] to be highlighted!")
    )
    
    Begin
    {
        
        $Color = @{       
                    0='Yellow'      
                    1='Magenta'     
                    2='Red'         
                    3='Cyan'        
                    4='Green'       
                    5 ='Blue'        
                    6 ='DarkGray'    
                    7 ='Gray'        
                    8 ='DarkYellow'    
                    9 ='DarkMagenta'    
                    10='DarkRed'     
                    11='DarkCyan'    
                    12='DarkGreen'    
                    13='DarkBlue'        
        }

        $ColorLookup =@{}

        For($i=0;$i -lt $words.count ;$i++)
        {
            if($i -eq 13)
            {
                $j =0
            }
            else
            {
                $j = $i
            }

            $ColorLookup.Add($words[$i],$Color[$j])
            $j++
        }
        
    }
    Process
    {
    $content | ForEach-Object {
    
        $TotalLength = 0
               
        $_.split() | `
        Where-Object {-not [string]::IsNullOrWhiteSpace($_)} | ` #Filter-out whiteSpaces
        ForEach-Object{
                        if($TotalLength -lt ($Host.ui.RawUI.BufferSize.Width-10))
                        {
                            #"TotalLength : $TotalLength"
                            $Token =  $_
                            $displayed= $False
                            
                            Foreach($Word in $Words)
                            {
                                if($Token -like "*$Word*")
                                {
                                    $Before, $after = $Token -Split "$Word"
                              
                                        
                                    #"[$Before][$Word][$After]{$Token}`n"
                                    
                                    Write-Host $Before -NoNewline ; 
                                    Write-Host $Word -NoNewline -Fore Black -Back $ColorLookup[$Word];
                                    Write-Host $after -NoNewline ; 
                                    $displayed = $true                                   
                                    #Start-Sleep -Seconds 1    
                                    #break  
                                }

                            } 
                            If(-not $displayed)
                            {   
                                Write-Host "$Token " -NoNewline                                    
                            }
                            else
                            {
                                Write-Host " " -NoNewline  
                            }
                            $TotalLength = $TotalLength + $Token.Length  + 1
                        }
                        else
                        {                      
                            Write-Host '' #New Line  
                            $TotalLength = 0 

                        }

                            #Start-Sleep -Seconds 0.5
                        
        }
        Write-Host '' #New Line               
    }
    }
    end
    {    }

}


#Trace-Word -content (Get-Content iis.log) -words "IIS", 's', "exe", "10", 'system'