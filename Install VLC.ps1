Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]
$TextBoxObject = [System.Windows.Forms.TextBox]

$BoomForm = New-Object $FormObject
$BoomForm.ClientSize = '500,400'
$BoomForm.Text = 'Boom I.T Setups'
$BoomForm.BackColor = "#878a8c"

$lbltitle = New-Object $LabelObject
$lbltitle.Text = 'Lenovo Vantage'
$lbltitle.AutoSize = $true
$lbltitle.Location = New-Object System.Drawing.Point(120, 20)
$lbltitle.Font = 'Verdana,24,style=Bold'

$btnVLC = New-Object $ButtonObject
$btnVLC.Text = 'Install VLC'
$btnVLC.AutoSize = $true
$btnVLC.Font = 'Verdana,24,style=Bold'
$btnVLC.Location = New-Object System.Drawing.Point(150, 150)

$progressBox = New-Object $TextBoxObject
$progressBox.Multiline = $true
$progressBox.ReadOnly = $true
$progressBox.ScrollBars = "Vertical"
$progressBox.Width = 400
$progressBox.Height = 150
$progressBox.Location = New-Object System.Drawing.Point(50, 250)

$BoomForm.Controls.AddRange(@($lbltitle, $btnVLC, $progressBox))

# Function Logic
function InstallVLC {
    choco install "vlc" -y
}


    $scriptPath = Join-Path -Path $env:TEMP -ChildPath "install_vlc.ps1"
    Set-Content -Path $scriptPath -Value $installScript

    $progressBox.AppendText("Starting installation...`r`n")
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath`"" -Wait
    $progressBox.AppendText("Installation completed`r`n")

    $lbltitle.Text = "VLC installed"
    $btnVLC.Enabled = $false
}

# Function Implementation
$btnVLC.Add_Click({ InstallVLC })

$BoomForm.ShowDialog()

$BoomForm.Dispose()
