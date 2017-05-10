Remove-Module PSReadLine -Force -ErrorAction SilentlyContinue
Clear-Host
if ( -not ( Get-Module PSClrCli ) ) { Import-Module PSClrCli }

$CWindow = CWindow -Id Window {
	CSingleLineTextbox -Text "SingleLineTextbox" -Top 2 -Left 2 -Width 20 -height 1
	#CText -InputObject "CText"
} -PassThru
$CWindow.Run()
Clear-Host
CReset
