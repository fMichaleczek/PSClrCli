#requires -Version 5


Add-Type -Path $PSScriptRoot\ClrCli.dll



function Reset-CursesConsole {
	[OutputType([System.Void])]
	param(

	)
	begin {

		

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "ResetConsoleWindow"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @())

	}
	end {

		return $Object

	}
}

function New-CursesText {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor = $host.UI.RawUI.ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor = $host.UI.RawUI.BackgroundColor, 

		[parameter()]
				[System.String] 
		$format, 

		[parameter()]
				[System.Object[]] 
		$InputObject
	)
	begin {

		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $fg = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $bg = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("InputObject")) { [void] $PSBoundParameters.Remove("InputObject") ; $args = $InputObject }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawText"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $fg, $bg, $format, $args))

	}
	end {

		return $Object

	}
}

function New-CursesText {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor = $host.UI.RawUI.ForegroundColor, 

		[parameter()]
				[System.String] 
		$format, 

		[parameter()]
				[System.Object[]] 
		$InputObject
	)
	begin {

		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $fg = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("InputObject")) { [void] $PSBoundParameters.Remove("InputObject") ; $args = $InputObject }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawText"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $fg, $format, $args))

	}
	end {

		return $Object

	}
}

function New-CursesRectangleShade {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor = $host.UI.RawUI.BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor = $host.UI.RawUI.ForegroundColor, 

		[parameter()]
				[System.Char] 
		$Char
	)
	begin {

		if ($PSBoundParameters.ContainsKey("Width")) { [void] $PSBoundParameters.Remove("Width") ; $w = $Width }
		if ($PSBoundParameters.ContainsKey("Height")) { [void] $PSBoundParameters.Remove("Height") ; $h = $Height }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $bg = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $fg = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("Char")) { [void] $PSBoundParameters.Remove("Char") ; $ch = $Char }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawRectShade"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $w, $h, $bg, $fg, $ch))

	}
	end {

		return $Object

	}
}

function New-CursesNothing {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$Color
	)
	begin {

		if ($PSBoundParameters.ContainsKey("Width")) { [void] $PSBoundParameters.Remove("Width") ; $w = $Width }
		if ($PSBoundParameters.ContainsKey("Height")) { [void] $PSBoundParameters.Remove("Height") ; $h = $Height }
		if ($PSBoundParameters.ContainsKey("Color")) { [void] $PSBoundParameters.Remove("Color") ; $c = $Color }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawNothing"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $w, $h, $c))

	}
	end {

		return $Object

	}
}

function New-CursesRectangleSolid {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$Color
	)
	begin {

		if ($PSBoundParameters.ContainsKey("Width")) { [void] $PSBoundParameters.Remove("Width") ; $w = $Width }
		if ($PSBoundParameters.ContainsKey("Height")) { [void] $PSBoundParameters.Remove("Height") ; $h = $Height }
		if ($PSBoundParameters.ContainsKey("Color")) { [void] $PSBoundParameters.Remove("Color") ; $c = $Color }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawRectSolid"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $w, $h, $c))

	}
	end {

		return $Object

	}
}

function New-CursesBlockOutline {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$Color
	)
	begin {

		if ($PSBoundParameters.ContainsKey("Width")) { [void] $PSBoundParameters.Remove("Width") ; $w = $Width }
		if ($PSBoundParameters.ContainsKey("Height")) { [void] $PSBoundParameters.Remove("Height") ; $h = $Height }
		if ($PSBoundParameters.ContainsKey("Color")) { [void] $PSBoundParameters.Remove("Color") ; $c = $Color }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawBlockOutline"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $w, $h, $c))

	}
	end {

		return $Object

	}
}

function New-CursesSingleOutline {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$Color
	)
	begin {

		if ($PSBoundParameters.ContainsKey("Width")) { [void] $PSBoundParameters.Remove("Width") ; $w = $Width }
		if ($PSBoundParameters.ContainsKey("Height")) { [void] $PSBoundParameters.Remove("Height") ; $h = $Height }
		if ($PSBoundParameters.ContainsKey("Color")) { [void] $PSBoundParameters.Remove("Color") ; $c = $Color }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawSingleOutline"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $w, $h, $c))

	}
	end {

		return $Object

	}
}

function New-CursesDoubleOutline {
	[OutputType([System.Void])]
	param(
		[parameter()]
				[System.Int32] 
		$x, 

		[parameter()]
				[System.Int32] 
		$y, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$Color
	)
	begin {

		if ($PSBoundParameters.ContainsKey("Width")) { [void] $PSBoundParameters.Remove("Width") ; $w = $Width }
		if ($PSBoundParameters.ContainsKey("Height")) { [void] $PSBoundParameters.Remove("Height") ; $h = $Height }
		if ($PSBoundParameters.ContainsKey("Color")) { [void] $PSBoundParameters.Remove("Color") ; $c = $Color }

	}
	process {

		$Type = [CLRCLI.BorderStyle].Assembly.GetType("CLRCLI.ConsoleHelper")
		$Method = $Type.GetMethods("NonPublic,Static").Where{$_.Name -eq "DrawDoubleOutline"} | Select-Object -First 1
		$Object = $Method.Invoke($null, @($x, $y, $w, $h, $c))

	}
	end {

		return $Object

	}
}

function New-CursesDrawBoxMethod {
	[OutputType([CLRCLI.ConsoleHelper+DrawBoxMethod])]
	param(
		[System.Object] 
		$object, 

		[System.IntPtr] 
		$method
	)
	begin {

		if ($PSBoundParameters.ContainsKey("object")) { [void] $PSBoundParameters.Remove("object") }
		if ($PSBoundParameters.ContainsKey("method")) { [void] $PSBoundParameters.Remove("method") }

	}
	process {

		$Object = [CLRCLI.ConsoleHelper+DrawBoxMethod]::new($object, $method)
		foreach ($Key in @($PSBoundParameters.Keys)) { $Object.$Key = $PSBoundParameters[$Key] }

	}
	end {

		return $Object

	}
}

function New-CursesWidget {
	[OutputType([CLRCLI.Widget])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$Background, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$Foreground, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackground, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackground, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForeground, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[System.String] 
		$Text, 

		[parameter()]
				[System.Collections.Generic.List`1[CLRCLI.Widget]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		$Object = [CLRCLI.Widget]::new($parent)
		foreach ($Key in @($PSBoundParameters.Keys)) { $Object.$Key = $PSBoundParameters[$Key] }
		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object

	}
}

function New-CursesButton {
	[OutputType([CLRCLI.Widgets.Button])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.Button]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesCheckbox {
	[OutputType([CLRCLI.Widgets.Checkbox])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[switch] 
		$Checked, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnValueChanged, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnValueChanged")) { [void] $PSBoundParameters.Remove("OnValueChanged") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.Checkbox]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnValueChanged) { [void] $Object.Add_ValueChanged($OnValueChanged) }
		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesHorizontalBarGraph {
	[OutputType([CLRCLI.Widgets.HorizontalBarGraph])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.Int32] 
		$Max, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.HorizontalBarGraph]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesHorizontalLine {
	[OutputType([CLRCLI.Widgets.HorizontalLine])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.HorizontalLine]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesListBox {
	[OutputType([CLRCLI.Widgets.ListBox])]
	param(
		[CLRCLI.Widget] 
		$Parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.Int32] 
		$SelectedIndex, 

		[parameter()]
				[System.Object] 
		$SelectedItem, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("Parent")) { [void] $PSBoundParameters.Remove("Parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.ListBox]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesRadioButton {
	[OutputType([CLRCLI.Widgets.RadioButton])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[switch] 
		$Checked, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnValueChanged, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnValueChanged")) { [void] $PSBoundParameters.Remove("OnValueChanged") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.RadioButton]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnValueChanged) { [void] $Object.Add_ValueChanged($OnValueChanged) }
		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesDialog {
	[OutputType([CLRCLI.Widgets.Dialog])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.Dialog]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesHorizontalProgressBar {
	[OutputType([CLRCLI.Widgets.HorizontalProgressBar])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.Int32] 
		$Value, 

		[parameter()]
				[System.Int32] 
		$MaxValue, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.HorizontalProgressBar]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesLabel {
	[OutputType([CLRCLI.Widgets.Label])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.Label]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesWindow {
	[OutputType([CLRCLI.Widgets.RootWindow])]
	param(
		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.Object] 
		$ViewModel, 

		[parameter()]
				[switch] 
		$AllowDraw, 

		[parameter()]
				[CLRCLI.Widget] 
		$ActiveWidget, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor = $host.UI.RawUI.BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor = $host.UI.RawUI.ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[CLRCLI.Widget] 
		$Parent, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$Run, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("Run")) { [void] $PSBoundParameters.Remove("Run") }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		$Object = [CLRCLI.Widgets.RootWindow]::new()
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($Run -eq $true) { [void] $Object.Run() }
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function Invoke-RootWindowGetWidgetTypes {
	[OutputType([System.Type[]])]
	param(

	)
	begin {

		

	}
	process {

		$Object = [CLRCLI.Widgets.RootWindow]::GetWidgetTypes.Invoke($null, @())

	}
	end {

		return $Object

	}
}

function Invoke-RootWindowLoadFromStream {
	[OutputType([CLRCLI.Widgets.RootWindow])]
	param(
		[parameter()]
				[System.IO.Stream] 
		$stream
	)
	begin {

		

	}
	process {

		$Object = [CLRCLI.Widgets.RootWindow]::LoadFromStream.Invoke($null, @($stream))

	}
	end {

		return $Object

	}
}

function Invoke-RootWindowLoadFromString {
	[OutputType([CLRCLI.Widgets.RootWindow])]
	param(
		[parameter()]
				[System.String] 
		$data
	)
	begin {

		

	}
	process {

		$Object = [CLRCLI.Widgets.RootWindow]::LoadFromString.Invoke($null, @($data))

	}
	end {

		return $Object

	}
}

function Invoke-RootWindowLoadFromFile {
	[OutputType([CLRCLI.Widgets.RootWindow])]
	param(
		[parameter()]
				[System.String] 
		$Filename
	)
	begin {

		

	}
	process {

		$Object = [CLRCLI.Widgets.RootWindow]::LoadFromFile.Invoke($null, @($Filename))

	}
	end {

		return $Object

	}
}

function New-CursesBorder {
	[OutputType([CLRCLI.Widgets.Border])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.Border]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesSingleLineTextbox {
	[OutputType([CLRCLI.Widgets.SingleLineTextbox])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.String] 
		$PasswordChar, 

		[parameter()]
				[System.Int32] 
		$CursorPosition, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.SingleLineTextbox]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesSlideToggle {
	[OutputType([CLRCLI.Widgets.SlideToggle])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[switch] 
		$Checked, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnValueChanged, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnValueChanged")) { [void] $PSBoundParameters.Remove("OnValueChanged") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.SlideToggle]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnValueChanged) { [void] $Object.Add_ValueChanged($OnValueChanged) }
		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesSpinner {
	[OutputType([CLRCLI.Widgets.Spinner])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[switch] 
		$Spinning, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.Spinner]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesTinySpinner {
	[OutputType([CLRCLI.Widgets.TinySpinner])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[switch] 
		$Spinning, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.TinySpinner]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}

function New-CursesVerticalLine {
	[OutputType([CLRCLI.Widgets.VerticalLine])]
	param(
		[CLRCLI.Widget] 
		$parent, 

		[parameter(ParameterSetName="Remaining",ValueFromRemainingArguments=$true)]
		$RemainingArguments, 

		[parameter()]
				[System.String] 
		$Id, 

		[parameter()]
				[System.Int32] 
		$Top, 

		[parameter()]
				[System.Int32] 
		$Left, 

		[parameter()]
				[System.Int32] 
		$Width, 

		[parameter()]
				[System.Int32] 
		$Height, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$BackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ForegroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$SelectedBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveBackgroundColor, 

		[parameter()]
		[ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray', 'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
		[System.ConsoleColor] 
		$ActiveForegroundColor, 

		[parameter()]
				[System.Int32] 
		$TabStop, 

		[parameter()]
		[ValidateSet('Block', 'Thick', 'Thin', 'None')]
		[CLRCLI.BorderStyle] 
		$Border, 

		[parameter()]
				[switch] 
		$Enabled, 

		[parameter()]
				[switch] 
		$DrawShadow, 

		[parameter()]
				[switch] 
		$HasFocus, 

		[parameter()]
				[string[]] 
		$Text, 

		[parameter()]
				[CLRCLI.Widget[]] 
		$Children, 

		[parameter()]
				[switch] 
		$Visible, 

		[parameter()]		[switch] 
		$SetFocus, 

		[parameter()]		[scriptblock] 
		$OnClicked, 

		[parameter()]		[scriptblock] 
		$OnGotFocus, 

		[parameter()]		[scriptblock] 
		$OnLostFocus, 

		[parameter()]		[scriptblock] 
		$OnTextChanged
	)
	begin {

		if ($PSBoundParameters.ContainsKey("parent")) { [void] $PSBoundParameters.Remove("parent") }
		if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }
		if ($PSBoundParameters.ContainsKey("BackgroundColor")) { [void] $PSBoundParameters.Remove("BackgroundColor") ; $PSBoundParameters["Background"] = $BackgroundColor }
		if ($PSBoundParameters.ContainsKey("ForegroundColor")) { [void] $PSBoundParameters.Remove("ForegroundColor") ; $PSBoundParameters["Foreground"] = $ForegroundColor }
		if ($PSBoundParameters.ContainsKey("SelectedBackgroundColor")) { [void] $PSBoundParameters.Remove("SelectedBackgroundColor") ; $PSBoundParameters["SelectedBackground"] = $SelectedBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveBackgroundColor")) { [void] $PSBoundParameters.Remove("ActiveBackgroundColor") ; $PSBoundParameters["ActiveBackground"] = $ActiveBackgroundColor }
		if ($PSBoundParameters.ContainsKey("ActiveForegroundColor")) { [void] $PSBoundParameters.Remove("ActiveForegroundColor") ; $PSBoundParameters["ActiveForeground"] = $ActiveForegroundColor }
		if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }
		if ($PSBoundParameters.ContainsKey("SetFocus")) { [void] $PSBoundParameters.Remove("SetFocus") }
		if ($PSBoundParameters.ContainsKey("OnClicked")) { [void] $PSBoundParameters.Remove("OnClicked") }
		if ($PSBoundParameters.ContainsKey("OnGotFocus")) { [void] $PSBoundParameters.Remove("OnGotFocus") }
		if ($PSBoundParameters.ContainsKey("OnLostFocus")) { [void] $PSBoundParameters.Remove("OnLostFocus") }
		if ($PSBoundParameters.ContainsKey("OnTextChanged")) { [void] $PSBoundParameters.Remove("OnTextChanged") }

	}
	process {

		if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } 
		$Object = [CLRCLI.Widgets.VerticalLine]::new($ObjectArgs)
		$ParentObject = $Object

if ($null -ne $RemainingArguments) {
	$Children = @()
	foreach($RemainingArgument in @($RemainingArguments) ) {
		if ($RemainingArgument -is [scriptblock]) {
			$Children += & $RemainingArgument
		}
	}
	<#
	if ($Children.Count -gt 0) {
		for ($i = 1 ; $i -lt $Children.Count ; $i++) {
			[void] $Object.Children.Add($Children[$i])
		}
	}
	#>
}
foreach ($Key in @($PSBoundParameters.Keys)) {
	$Object.$Key = $PSBoundParameters[$Key]
}

if ($Object.Children.Count -gt 0) {
	$ObjectList = @($Object) + @($Object.Children)
}
else {
	$ObjectList = @($Object)
}
@( $ObjectList ).Where{ -not [string]::IsNullOrEmpty($_.Id) }.Foreach{ New-Variable -Name $_.Id -Value $_ -Scope global -Force }

		if ($null -ne $OnClicked) { [void] $Object.Add_Clicked($OnClicked) }
		if ($null -ne $OnGotFocus) { [void] $Object.Add_GotFocus($OnGotFocus) }
		if ($null -ne $OnLostFocus) { [void] $Object.Add_LostFocus($OnLostFocus) }
		if ($null -ne $OnTextChanged) { [void] $Object.Add_TextChanged($OnTextChanged) }

	}
	end {

		return $Object
		if ($SetFocus -eq $true) { [void] $Object.SetFocus() }

	}
}


New-Alias -Name CReset -Value Reset-CursesConsole -Force
New-Alias -Name CText -Value New-CursesText -Force
New-Alias -Name CText -Value New-CursesText -Force
New-Alias -Name CRectangleShade -Value New-CursesRectangleShade -Force
New-Alias -Name CNothing -Value New-CursesNothing -Force
New-Alias -Name CRectangleSolid -Value New-CursesRectangleSolid -Force
New-Alias -Name CBlockOutline -Value New-CursesBlockOutline -Force
New-Alias -Name CSingleOutline -Value New-CursesSingleOutline -Force
New-Alias -Name CDoubleOutline -Value New-CursesDoubleOutline -Force
New-Alias -Name CDrawBoxMethod -Value New-CursesDrawBoxMethod -Force
New-Alias -Name CWidget -Value New-CursesWidget -Force
New-Alias -Name CButton -Value New-CursesButton -Force
New-Alias -Name CCheckbox -Value New-CursesCheckbox -Force
New-Alias -Name CHorizontalBarGraph -Value New-CursesHorizontalBarGraph -Force
New-Alias -Name CHorizontalLine -Value New-CursesHorizontalLine -Force
New-Alias -Name CListBox -Value New-CursesListBox -Force
New-Alias -Name CRadioButton -Value New-CursesRadioButton -Force
New-Alias -Name CDialog -Value New-CursesDialog -Force
New-Alias -Name CHorizontalProgressBar -Value New-CursesHorizontalProgressBar -Force
New-Alias -Name CLabel -Value New-CursesLabel -Force
New-Alias -Name CWindow -Value New-CursesWindow -Force
New-Alias -Name CBorder -Value New-CursesBorder -Force
New-Alias -Name CSingleLineTextbox -Value New-CursesSingleLineTextbox -Force
New-Alias -Name CSlideToggle -Value New-CursesSlideToggle -Force
New-Alias -Name CSpinner -Value New-CursesSpinner -Force
New-Alias -Name CTinySpinner -Value New-CursesTinySpinner -Force
New-Alias -Name CVerticalLine -Value New-CursesVerticalLine -Force


Export-ModuleMember -Function * -Alias *
