Remove-Module PSReadLine -Force -ErrorAction SilentlyContinue
Clear-Host
if ( -not ( Get-Module PSClrCli ) ) { Import-Module PSClrCli }

$Root = [CLRCLI.Widgets.RootWindow]::new()
$Dialog = [CLRCLI.Widgets.Dialog]::new($Root)

    $Dialog.Text = "List Running Processes"
    $Dialog.Width = 60
    $Dialog.Height = 32
    $Dialog.Top = 4
    $Dialog.Left = 4
    $Dialog.Border = [CLRCLI.BorderStyle]::Thick
 $Label = [CLRCLI.Widgets.Label]::new($Dialog)
    $Label.Text = "Running Processes"
    $Label.Top = 2
    $Label.Left = 2

    $Button = [CLRCLI.Widgets.Button]::new($Dialog)
    $Button.Text = "Get Processes"
    $Button.Top = 4
    $Button.Left = 6
    $Button.Width = 25

    $Button2 = [CLRCLI.Widgets.Button]::new($Dialog)
    $Button2.Text = "Show Alternate Window"
    $Button2.Top = 4
    $Button2.Left = 34
    $Button2.Width = 25

    $list = [CLRCLI.Widgets.ListBox]::new($Dialog)
    $list.top = 10
    $list.Left = 4
    $list.Width = 32
    $list.height = 20
    $list.Border = [CLRCLI.BorderStyle]::Thin

  $Dialog2 = [CLRCLI.Widgets.Dialog]::new($Root)
    $Dialog2.Text = "ooooh"
    $Dialog2.Width = 32
    $Dialog2.Height = 5
    $Dialog2.Top = 6
    $Dialog2.Left = 6
    $Dialog2.Border = [CLRCLI.BorderStyle]::Thick
    $Dialog2.Visible = $false

  $Button3 = [CLRCLI.Widgets.Button]::new($Dialog2)
    $Button3.Text = "Bye!"
    $Button3.Width = 8
    $Button3.Height =3
    $Button3.Top = 1
    $Button3.Left = 1

 $Button3.Add_Clicked({$Dialog2.Hide(); $Dialog.Show()})
    $Button2.Add_Clicked({$Dialog.Hide(); $Dialog2.Show()})
    $Button.Add_Clicked({ 
		Get-Process | Select -Unique ProcessName | Select -ExpandProperty ProcessName | Foreach {
			$List.Items.Add($_)
		}
	})
	$Root.Run()