Remove-Module PSReadLine -Force -ErrorAction SilentlyContinue
Clear-Host
if ( -not ( Get-Module PSClrCli ) ) { Import-Module PSClrCli }

$DialogArgs = @{
	Top = 5
	Left = [int][math]::Round(($host.UI.RawUI.MaxWindowSize.Width/4),0)
	Width = [int][math]::Round(($host.UI.RawUI.MaxWindowSize.Width/2),0)
	Height = 32
	Border = 'Thick'
}

$CWindow = CWindow -Id Window {
	
    CHorizontalLine -Id TopBar -Top 0 -Height 1 -Width $host.UI.RawUI.MaxWindowSize.Width -BackgroundColor Gray -Foreground DarkGray -Enabled {
		CLabel -Text ("ComputerName : {0} / UserName : {1}" -f $env:ComputerName, $env:UserName) -Top 0 -Left 3  -Foreground Black -BackgroundColor Gray
	}

    CTinySpinner -Id TinySpinner -Top 1 -Left 0 -Width 1 -Height 1 -Visible:$False -BackgroundColor Gray -Foreground DarkGray 
	
    CSpinner -Id Spinner -Top 0 -Left 1 -Width 3 -Height 3 -Visible:$False -BackgroundColor Gray -Foreground DarkGray 
	
	CDialog -Id Welcome -Text "Welcome" @DialogArgs {
		
		CLabel -Text 'Welcome' -Top 2 -Left 2
		
		CButton -Text "Processes" -Top 4 -Left 6 -Width 16 -OnClicked {
			$Welcome.Visible = $false
			$Processes.Visible = $true
			$Processes.Show()
		}
		CButton -Text "PowerShell" -Top 4 -Left 34 -Width 16 -OnClicked {
			$Welcome.Visible = $false
			$PowerShell.Visible = $true
			$PowerShell.Show()
		}
		CButton -Text "Help" -Top 10 -Left 6 -Width 16 -OnClicked {
			$Welcome.Visible = $false
			$Help.Visible = $true
			$Help.Show()
		}
		CButton -Text "Exit" -Top 10 -Left 34 -Width 16 -OnClicked {
			$Search.Visible = $false
			$Window.Visible = $false
			Reset-CursesConsole
			$Window.Detach()
			Import-Module PSReadLine -Force -ErrorAction SilentlyContinue
			Clear-Host
			
		}
		
		CCheckBox -Text "CheckBox" -Top 15 
		CCheckBox -Text "CheckBox2" -Top 16 
		CCheckBox -Text "CheckBox3" -Top 17
		
		CHorizontalLine -Top 18 -Height 1 -Width 20 -Foreground Red
		
		CRadioButton -Text "Radio1" -Top 20 
		CRadioButton -Text "Radio2" -Top 21 
		CRadioButton -Text "Radio3" -Top 22
		CRadioButton -Text "Radio4" -Top 23 
		
		CHorizontalLine -Top 24 -Height 1 -Width 20 -Foreground Red
		
		CSlideToggle -Width 10 -Height 3 -Top 25 -Left 3 
		
		CHorizontalLine -Top 26 -Height 1 -Width 20 -Foreground Red
		
		CHorizontalProgressBar  -Width 16 -Height 1 -Top 27 
		
		CHorizontalLine -Top 28 -Height 1 -Width 20 -Foreground Red
		
		CHorizontalBarGraph -Text "--------" -Width 10 -Height 3 -Top 29 -Left 3 -Max 9 -BackgroundColor Red -ForegroundColor White
		
		CLabel -Text 'Search : ' -Top 15 -Left 34
		
		CSingleLineTextbox -Id Search -Text "Enter Command here ..."  -Top 15 -Left 45 -Width 18 -height 1 -OnGotFocus {
				$global:OldSearchText = $Search.Text
				$Search.Text = ''
			} -OnLostFocus {
				$Search.Text = $global:OldSearchText
			}
		CHorizontalLine -Top 14 -Height 1 -Width 20 -Foreground Red
	}

	CDialog -Id Processes -Text "Processes" @DialogArgs -Visible:$False  {
		CLabel -Text 'Running Processes' -Top 2 -Left 2
		CButton -Text 'Get Processes' -Top 4 -Left 6  -Width 16 -OnClicked { 
			$Spinner.Visible = $Spinner.Spinning = $true
			Get-Process | Group ProcessName | Sort Count -Descending | Foreach { 
				$List1.items.Add(("{0} ({1})" -f $_.Name, $_.Count))
			}
			$Spinner.Visible = $Spinner.Spinning = $false
		}
		CVerticalLine -Top 4 -Left 30 -Width 1 -Height 20
		CButton -Text "<< Back" -Top 4 -Left 34 -Width 16  -OnClicked {
			$Processes.Visible = $false
			$Welcome.Visible = $true
			$Welcome.Show()
		}		
		
		CListBox -Id List1 -Top 10 -Left 6 -Width 16 -Height 16 -Border Thin
	}
	
    CDialog -Id PowerShell -Text "PowerShell"  @DialogArgs -Visible:$False  {
		CButton -Text 'Get Module' -Top 4 -Left 6  -Width 16 -OnClicked { 
            $TinySpinner.Visible = $TinySpinner.Spinning = $true
			Get-Module -ListAvailable | Foreach { 
				$ModuleList.items.Add(("{0} ({1})" -f $_.Name, $_.Version))
			}
             $TinySpinner.Visible = $TinySpinner.Spinning = $false
		}
        CButton -Text "<< Back" -Top 4 -Left 34 -Width 16 -OnClicked {
			$PowerShell.Visible = $false
			$Welcome.Visible = $true
			$Welcome.Show()
		}	
        CListBox -Id ModuleList -Top 10 -Left 6 -Width 48 -Height 16 -Border Thin	
	}
	
	CDialog -Id Help -Text Help @DialogArgs -Visible:$False {
		CButton -Text "<< Back" -Top 4 -Left 34 -Width 16 -OnClicked {
			$Help.Visible = $false
			$Welcome.Visible = $true
			$Welcome.Show()
		}
	}

} -PassThru
$CWindow.Run()

