# -------------------------------------------------------------------
# Input Variable 
# -------------------------------------------------------------------

$VerbosePreference = 'Continue'
$ErrorActionPreference = 'Stop'

$Generator = @{
	NugetPackageName = 'ClrCli'	
	Module = @{
		Name = 'PSClrCli'
		Version = '1.0.0.0'
		Path = $PSScriptRoot
	}
}

# -------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------

function New-Function {
	Param(
		$Name, $OutputType, $Parameters, $BeginBlock, $ProcessBlock, $EndBlock
	)
	if ($OutputType -ne $null) {
		$OutputType = "`n`t[OutputType([{0}])]" -f $OutputType
	}
	$Pattern = "function {0} {{{1}`n`tparam(`n{2}`n`t)`n`tbegin {{`n`n`t`t{3}`n`n`t}}`n`tprocess {{`n`n`t`t{4}`n`n`t}}`n`tend {{`n`n`t`t{5}`n`n`t}}`n}}"
	$Pattern -f @(
		$Name
		$OutputType
		$Parameters -join ", `n`n"
		$BeginBlock -join "`n`t`t"
		$ProcessBlock -join "`n`t`t"
		$EndBlock -join "`n`t`t"
	)
}

# -------------------------------------------------------------------
# Main Variable 
# -------------------------------------------------------------------

$Module = @{
	Name = $Generator.Module.Name
	Version = "1.0.0"
	GUID = "$(New-Guid)"
	Path = "{0}" -f $Generator.Module.Path
	File = "{0}.psm1" -f  $Generator.Module.Name
	Manifest = "{0}.psd1" -f  $Generator.Module.Name
	NugetPackage = $Generator.NugetPackageName
	Assembly = "{0}.dll" -f  $Generator.NugetPackageName
	Functions = @()
	Aliases = @()
	Pattern = @{
		ModuleFile = @"
#requires -Version 5`n`n
Add-Type -Path `$PSScriptRoot\ClrCli.dll
{0}`n`n
{1}`n`n
{2}`n`n
Export-ModuleMember -Function * -Alias *
"@
		ModuleManifestFile = @"
@{{
`tGuid = '{0}'
`tModuleVersion = '{1}'
`tDescription = ''
`tModuleToProcess = '{2}'
`tFunctionsToExport = '*'
}}
"@
		Function = @"
function {0} {{
`t[OutputType([{1}])]
`tparam(
{2}
`t)
`tBegin {{`n{3}`n`t}}
`tProcess {{`n{4}`n`t}}
`tEnd {{`n{5}`n`t}}
}}
"@
		Alias = @"
New-Alias -Name {0} -Value {1} -Force
"@
	}
}

$FunctionArgs = @{
	Name = [string]::Empty
	OutputType = [string]::Empty
	Parameters = @()
	BeginBlock = @()
	ProcessBlock = @()
	EndBlock = @()
}

# Create Module Directory
New-Item -Type Directory -Path $Module.Path -Force | Out-Null

# -------------------------------------------------------------------
# Download NugetPackge
# -------------------------------------------------------------------

if ( -not ( Test-Path "$($Module.Path)\$($Module.Assembly)" ) ) {
	Write-Verbose "Downloading NugetPackge $($Module.NugetPackage) ..."
	
	$TempPath = New-Item -Type Directory -Path "$($Module.Path)\TempPath" -Force | Select -Expand FullName
	$Package = Save-Package -Name $Module.NugetPackage -Source https://www.nuget.org/api/v2/ -ProviderName nuget -Path $TempPath
	$Filename = "{0}\{1}" -f $TempPath, $Package.PackageFilename
	$NewFilename = "{0}\{1}" -f $TempPath, $Package.PackageFilename.Replace(".nupkg",".zip")
	Rename-Item -Path $Filename -NewName $NewFilename -Force -EA 0
	Expand-Archive -Path $NewFilename -DestinationPath $TempPath -Force
	
	Write-Verbose "Moving ClrCli CLR ..."
	Move-Item -Path "$TempPath\lib\net45\$($Module.Assembly)" -Destination "$($Module.Path)\$($Module.Assembly)" -Force
	
	Write-Verbose "Cleaning  Temp Download Folder ..."
	Remove-Item -Path "$TempPath\*" -Recurse -Force
	Remove-Item -Path "$TempPath" -Force
}

# -------------------------------------------------------------------
# Filter and Browse Type List
# -------------------------------------------------------------------

$InstanceFlags = [System.Reflection.BindingFlags]'Instance, Public, NonPublic'
$StaticFlags   = [System.Reflection.BindingFlags]'Static, Public, NonPublic'

$BaseFilterScript = @{
	Module = @{
		Name = { $_.Name }
	}
	Type = { 
		$_.Name -notlike "*_*" -and
		-not $_.IsInterface   -and
		-not $_.IsGenericType
	}
	Member = { 
		$_.Name -notlike "*_*" -and
		$_.Module.ToString() -notin @('CommonLanguageRuntimeLibrary')
	}
}

<#
$Rules = @{
	ModuleName = {}
	Type = { }
	Member = {}
	Instance = @{
		FunctionName = {}
		AliasName = {}
		ConstructorParameters = {}
		Constructor = {}
		Parameters = {}
		Methods ={}
	}
	Static = @{
		FunctionName = {}
		AliasName = {}
		Parameters = {}
		Methods ={}
	}
}
#>

$TypeList = Add-Type -Path "$($Module.Path)\$($Module.Assembly)" -PassThru

$FilteredTypeList = $TypeList | Where -FilterScript $BaseFilterScript.Type

foreach ( $Type in @( $FilteredTypeList ) ) {

	Write-Verbose ( "Analyzing Type {0} ..." -f $Type.FullName )
	
	$MemberList = @( @( $Type.GetMembers($StaticFlags) + $Type.GetMembers($InstanceFlags) ) | Where -FilterScript $BaseFilterScript.Member )
	
	if ($Type.IsClass) {
		
		Write-Verbose ( "Type {0} is Class" -f $Type.FullName )
		
		$ConstructorList = @( $MemberList | Where { $_.IsConstructor } ) #-FilterScript $Rules.Instance.Constructor
	
		if ($MemberList.Where{$_.IsConstructor}.Count -gt 0) {
		
			Write-Verbose ( "Type {0} has constructor" -f $Type.FullName )
			
			$Constructor = $ConstructorList.Where{$_.IsPublic} | Select -First 1 -EA 0
			if ($null -eq $Constructor) {
				$Constructor = $ConstructorList.Where{-not $_.IsPublic} | Select -First 1 -EA 0
			}
			
			$Function = $FunctionArgs.Clone()
			$Function.OutputType = $Type.FullName
			$Function.Name =
				switch($Type) {
					{ $_.FullName -eq "CLRCLI.Widgets.RootWindow" } { 
						"New-CursesWindow" ; break; 
					}
					{ $_.FullName -like "CLRCLI.Widgets.*" } { 
						"New-Curses{0}" -f $_.Name ; break; 
					}
					default { "New-Curses{0}" -f $_.Name }
				}

			$Alias =
				switch($Type) {
					{ $_.FullName -eq "CLRCLI.Widgets.RootWindow" } { 
						@{ Name = "CWindow" ; Value = $Function.Name } ; break; 
					}
					{ $_.FullName -like "CLRCLI.Widgets.*" } { 
						@{ Name = ( "C{0}" -f $_.Name ) ; Value = $Function.Name } ; break; 
					}
					default {
						@{ Name = ( "C{0}" -f $_.Name ) ; Value = $Function.Name } ; break; 
					}
				}
				
			Write-Verbose ( "Mapping Type {0} Instance Class to Function {1} ({2}) ..." -f $Type.FullName, $Function.Name, $Alias.Name )
			
			#------------------------------------------------------------------------------------
			#  Wrapping Constructors
			#------------------------------------------------------------------------------------
			
			$ConstructorParameterList = @( $Constructor.GetParameters() )
			
			if ($ConstructorParameterList.Count -gt 0) {
				
				Write-Verbose ( "Type {0} Found {1} Constructor(s) Parameter" -f $Type.FullName, $ConstructorParameterList.Count )
			
				$ConstructorArgsList = @()
				foreach ($ConstructorParameter in $ConstructorParameterList) {
					switch($ConstructorParameter) {
						{ $Type.FullName -like "CLRCLI.Widgets.*" } {
							$Function.Parameters += "`t`t[{0}] `n`t`t`${1}" -f $_.ParameterType, $_.Name
							$Function.BeginBlock += 'if ($PSBoundParameters.ContainsKey("{0}")) {{ [void] $PSBoundParameters.Remove("{0}") }}' -f $_.Name
							break ; 
						}
						default {
							$Function.Parameters += "`t`t[{0}] `n`t`t`${1}" -f $_.ParameterType, $_.Name
							$Function.BeginBlock += 'if ($PSBoundParameters.ContainsKey("{0}")) {{ [void] $PSBoundParameters.Remove("{0}") }}' -f $_.Name
						}
					}
					$ConstructorArgsList += '${0}' -f $ConstructorParameter.Name
				}
				$ConstructorArgs = $ConstructorArgsList -join ", "
			}
			else {
				$ConstructorArgs = [string]::Empty
			}
			
			# Construct Object and Keep Parent in global Scope
			# Wrap Function Parameters to Object's properties or Remaining Arguments
			switch($Type) {
				{ $_.FullName -like "CLRCLI.Widgets.*" } {
					$Function.Parameters += "`t`t[parameter(ParameterSetName=`"Remaining`",ValueFromRemainingArguments=`$true)]`n`t`t`$RemainingArguments"
					$Function.BeginBlock += 'if ($PSBoundParameters.ContainsKey("RemainingArguments")) { [void] $PSBoundParameters.Remove("RemainingArguments") } else { $RemainingArguments = $null }'
					if ($_.FullName -eq "CLRCLI.Widgets.RootWindow") {
						$Function.ProcessBlock += '$Object = [{0}]::new()' -f $_.FullName
					}
					else {
						$Function.ProcessBlock += 'if ($null -ne $parent) { $ObjectArgs = $parent } else { $ObjectArgs = Get-Variable -Scope 1 -Name ParentObject -ValueOnly -ErrorAction 0 } '
						$Function.ProcessBlock += '$Object = [{0}]::new($ObjectArgs)' -f $_.FullName
					}
					$Function.ProcessBlock += @'
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

'@
					$Function.EndBlock += 'return $Object'
					break;
				}
				default {
					$Function.ProcessBlock += '$Object = [{0}]::new({1})' -f @( $_.FullName, $ConstructorArgs )
					if ($ParameterList.Count -gt 0) {
						$Function.ProcessBlock += 'foreach ($Key in @($PSBoundParameters.Keys)) { $Object.$Key = $PSBoundParameters[$Key] }'
					}
					$Function.EndBlock += 'return $Object'
				}
			}
				
			#------------------------------------------------------------------------------------
			#  Wrapping Properties
			#------------------------------------------------------------------------------------
			foreach ($Member in $MemberList.Where{$_.MemberType -eq [System.Reflection.MemberTypes]::Property -and $_.CanWrite}) {
			
				if ($Member.Name -notin $ConstructorParameterList.Name) {
				
					$Parameter = [ordered]@{}

					# Build Parameter Definition
					$Parameter.Definition =
						switch($Member) {
							default { '[parameter()]' }
						}
						
					# Build Parameter Name
					$Parameter.Name =
						switch($Member) {
							{  $Type.FullName -like "CLRCLI.Widgets.*" -and $_.Name  -like "*ground" } { 
								$NewName = $_.Name.Replace('ground', 'groundColor')
								$NewName
								$Function.BeginBlock += 'if ($PSBoundParameters.ContainsKey("{1}")) {{ [void] $PSBoundParameters.Remove("{1}") ; $PSBoundParameters["{0}"] = ${1} }}' -f $_.Name, $NewName
								break 
							}
							default { $_.Name }
						}
					
					# Build Parameter Type
					$Parameter.Type =
						switch($Member) {
							{ $Type.FullName -like "CLRCLI.Widgets.*" -and $_.Name -eq 'Text' } { 
								'string[]'
								$Function.BeginBlock += 'if ($PSBoundParameters.ContainsKey("Text") -and $PSBoundParameters["Text"] -is [string[]]) { $PSBoundParameters["Text"] = $Text = $Text -join "`n" }' 
								break 
							}
							{ $Type.FullName -like "CLRCLI.Widgets.*" -and $_.Name -like "*Children" } {
								'CLRCLI.Widget[]'
								break 
							}
							{ $_.PropertyType -eq [System.Boolean] } { 
								'switch'
								break ;
							}
							default { "{0}" -f $_.PropertyType  }
						}
					
					# Build Parameter Validation
					$Parameter.Validation =
						switch($Member) {
							{([type]$_.PropertyType).IsEnum } { "[ValidateSet({0})]`n" -f ( [Enum]::GetValues($_.PropertyType).Foreach{"'$_'"} -join ", " ) }
						}
					
					# Build Parameter Default Value 
					$Parameter.DefaultValue = 
						switch($Member) {
							{ $_.Name -eq "Background" -and $Type.FullName -eq 'CLRCLI.Widgets.RootWindow' }  { 
								' = $host.UI.RawUI.BackgroundColor' 
								break;
							}
							{ $_.Name -eq 'Foreground' -and $Type.FullName -eq 'CLRCLI.Widgets.RootWindow' }  { 
								' = $host.UI.RawUI.ForegroundColor' 
								break;
							}
							default { '' }
						}
					
						
					
					# Build All Parameters
					$Function.Parameters += "`t`t{1}`n`t`t{3}`t`t[{2}] `n`t`t`${0}{4}" -f @(
						$Parameter.Name
						$Parameter.Definition
						$Parameter.Type
						$Parameter.Validation
						$Parameter.DefaultValue
					)
				}
			}
			
			#------------------------------------------------------------------------------------
			#  Wrapping Methods
			#------------------------------------------------------------------------------------
			foreach ($Member in $MemberList.Where{ ( $_.IsPublic -and $_.MemberType -eq [System.Reflection.MemberTypes]::Method ) -or ($_.MemberType -eq [System.Reflection.MemberTypes]::Event) }) {
							
				$Parameter = [ordered]@{}
				
				# Build Parameter Name
				$Parameter.Name =
					switch($Member) {
						{  $Type.FullName -like "CLRCLI.Widgets.*" -and $_.Name -in @('SetFocus', 'Run') }    { 
							$_.Name 
						}
						{ $_.MemberType -eq [System.Reflection.MemberTypes]::Event  } { 
							"On" + $_.Name
						}
					}
				
				# Only Build on Matched Parameter Name Rules
				if ($Parameter.Name -eq $null) {
					Continue
				}
				
				$Function.BeginBlock += 'if ($PSBoundParameters.ContainsKey("{0}")) {{ [void] $PSBoundParameters.Remove("{0}") }}' -f $Parameter.Name
				
				# Build Parameter Definition
				$Parameter.Definition =
					switch($Member) {
						default { '[parameter()]' }
					}
					
				# Build Parameter Type
				$Parameter.Type =
					switch($Member) {
						{ $Type.FullName -like "CLRCLI.Widgets.*" -and $_.Name -in @('SetFocus', 'Run') }    { 
							'switch'
							$Function.EndBlock += 'if (${0} -eq $true) {{ [void] $Object.{1}() }}' -f $Parameter.Name, $_.Name
							break;
						}
						{ $_.MemberType -eq [System.Reflection.MemberTypes]::Event } { 
							'scriptblock'
							$Function.ProcessBlock += 'if ($null -ne ${0}) {{ [void] $Object.Add_{1}(${0}) }}' -f $Parameter.Name, $_.Name
							break;
						}
					}
				
				# Build All Parameters
				$Function.Parameters += "`t`t{1}`t`t[{2}] `n`t`t`${0}" -f @(
					$Parameter.Name
					$Parameter.Definition
					$Parameter.Type
				)
				
			}
			
			#------------------------------------------------------------------------------------
			# Update Module
			#------------------------------------------------------------------------------------
			$Module.Functions += New-Function @Function
			if ($null -ne $Alias) {
					$Module.Aliases += "New-Alias -Name {0} -Value {1} -Force" -f $Alias.Name, $Alias.Value
				}
		}
		
		if ($MemberList.Where{$_.IsStatic -and ( $_.IsPublic -or $_.IsPublic -eq $Type.IsPublic ) }.Count -gt 0) {
			Write-Verbose ( "Type {0} has Static Members" -f $Type.FullName )
			
			foreach ($Member in $MemberList.Where{$_.IsStatic}) {
				
				$Function = $FunctionArgs.Clone()
				$Function.OutputType = $Member.ReturnType
				$Function.Name =
					switch($Type) {
						{ $_.FullName -eq "CLRCLI.ConsoleHelper" -and $Member.Name -eq "ResetConsoleWindow" } { 
							"Reset-CursesConsole"
							break;
						}
						{ $_.FullName -eq "CLRCLI.ConsoleHelper" -and $Member.Name -like "Draw*"}  { 
							"New-Curses{0}" -f $Member.Name.Replace('Draw','').Replace('Rect','Rectangle')
							break; 
						}
						default { 
							"Invoke-{0}{1}" -f $Type.Name, $Member.Name
						}
					}
				
				$Alias =
					switch($Type) {
						{ $_.FullName -eq "CLRCLI.ConsoleHelper" -and $Member.Name -eq "ResetConsoleWindow" } { 
							@{ Name = "CReset" ; Value = $Function.Name } ;	break; 
						}
						{ $_.FullName -eq "CLRCLI.ConsoleHelper" -and $Member.Name -like "Draw*"}  { 
							@{ Name  = $Function.Name.Replace('New-Curses','C') ;Value = $Function.Name } ; break; 
						}
						default {
							$null
						}
					}
				
				Write-Verbose ( "Mapping Type {0} Static Method Class to Function {1} ({2}) ..." -f $Type.FullName, $Function.Name, $Alias.Name )
				
				#--------------
				#  Wrapping Methods
				#--------------
				#
				
				$ParameterList = $Member.GetParameters()
				
				if ($ParameterList.Count -gt 0) {
					foreach ($MemberParameter in $ParameterList) {
							
						$Parameter = [ordered]@{}
					
						# Build Parameter Definition
						$Parameter.Definition =
							switch($MemberParameter) {
								default { '[parameter()]' }
							}
						
						# Build Parameter Name
						$Parameter.Name =
							switch($MemberParameter.Name) {
								'c'      { 'Color' ; break ; }
								'w'	     { 'Width'; break ;  }
								'h'	     { 'Height' ; break ; }
								'ch'	 { 'Char'; break ;  }
								'fg'     { 'ForegroundColor'; break ;  }
								'bg'	 { 'BackgroundColor' ; break ; }
								'args'   { 'InputObject'; break ;  }
								default  { $_ }
							}
						
						if ($MemberParameter.Name -ne $Parameter.Name) {
							$Function.BeginBlock += 'if ($PSBoundParameters.ContainsKey("{1}")) {{ [void] $PSBoundParameters.Remove("{1}") ; ${0} = ${1} }}' -f $MemberParameter.Name, $Parameter.Name
						}
						
						# Build Parameter Type
						$Parameter.Type =
							switch($MemberParameter) {
								{ $_.ParameterType -eq 'System.Boolean' }      { 'switch' ; break ;  }
								default 									   { $_.ParameterType }
							}
						
						# Build Parameter Validation
						$Parameter.Validation =
							switch($MemberParameter) {
								{([type]$_.ParameterType).IsEnum } { 
									"[ValidateSet({0})]`n" -f ( [Enum]::GetValues($_.ParameterType).Foreach{"'$_'"} -join ", " ) 
								}
							}
						
						# Build Parameter Default Value 
						$Parameter.DefaultValue = 
							switch($MemberParameter) {
								{ $Type.Name -eq 'ConsoleHelper' -and $_.Name -eq 'bg' }  { 
									' = $host.UI.RawUI.BackgroundColor' 
									break;
								}
								{ $Type.Name -eq 'ConsoleHelper' -and $_.Name -eq 'fg' }  { 
									' = $host.UI.RawUI.ForegroundColor'
									break;
								}
								default { '' }
							}
						
						# Build All Parameters
						$Function.Parameters += "`t`t{1}`n`t`t{3}`t`t[{2}] `n`t`t`${0}{4}" -f @(
							$Parameter.Name
							$Parameter.Definition
							$Parameter.Type
							$Parameter.Validation
							$Parameter.DefaultValue
						)
						
					}
				}
				
				# Manage Return Object
				switch($Type) {
					{ -not $_.IsPublic } {
						$Function.ProcessBlock += '$Type = [CLRCLI.BorderStyle].Assembly.GetType("{0}")' -f $Type.Fullname
						$Function.ProcessBlock += '$Method = $Type.GetMethods("NonPublic,Static").Where{{$_.Name -eq "{0}"}} | Select-Object -First 1' -f $Member.Name
						$Function.ProcessBlock += '$Object = $Method.Invoke($null, @({0}))' -f $( $ParameterList.Foreach{'${0}' -f $_.Name} -join ", " )
						# if ($ParameterList.Count -gt 0) {
							# $Function.ProcessBlock += 'foreach ($Key in @($PSBoundParameters.Keys)) { $Object.$Key = $PSBoundParameters[$Key] }'
						# }
						$Function.EndBlock += 'return $Object'
						break;			
					}
					default {
						$Function.ProcessBlock += '$Object = [{0}]::{1}.Invoke($null, @({2}))' -f @(
							$_.FullName
							$Member.Name
							( $ParameterList.Foreach{'${0}' -f $_.Name} -join ", " )
						)
						# if ($ParameterList.Count -gt 0) {
							# $Function.ProcessBlock += 'foreach ($Key in @($PSBoundParameters.Keys)) { $Object.$Key = $PSBoundParameters[$Key] }'
						# }
						$Function.EndBlock += 'return $Object'
					}
				}
				
				#--------------
				#  Update Module
				#--------------
				#
				
				$Module.Functions += New-Function @Function
				if ($null -ne $Alias) {
					$Module.Aliases += "New-Alias -Name {0} -Value {1} -Force" -f $Alias.Name, $Alias.Value
				}
			}
		}
	
	}
	elseif ($Type.IsEnum) {
		Write-Verbose ( "Type {0} is Enum" -f $Type.FullName )
	}
	
}

# -------------------------------------------------------------------
# Building Module
# -------------------------------------------------------------------

Write-Verbose "Building Module File ..."
$ModuleContent = $Module.Pattern.ModuleFile -f @(
	''
	$Module.Functions -join "`n`n"
	$Module.Aliases -join "`n"
)
Set-Content -Path  "$($Module.Path)\$($Module.File)"  -Value $ModuleContent  -Force

Write-Verbose "Building Manifest Module ..."
$ModuleManifestContent = $Module.Pattern.ModuleManifestFile -f @(
	$Module.Guid
	$Module.Version
	$Module.File
)
Set-Content -Path "$($Module.Path)\$($Module.Manifest)" -Value $ModuleManifestContent -Force

Write-Verbose "Module is ready."



# -------------------------------------------------------------------
# Kitchen
# -------------------------------------------------------------------
$HostArgs = @{Foreground='Cyan'}

Write-Host @HostArgs "Importing Module ..."
Import-Module $Module.Path -Force -PassThru | Format-Table -Auto

Write-Host @HostArgs "Module Functions :"
Get-Command -CommandType Function -Module $Module.Name | Format-Wide -Auto

Write-Host @HostArgs "Module Alias : "
Get-Command -CommandType Alias -Module $Module.Name | Format-Wide -Auto

# Invoke-Item $Module.Path