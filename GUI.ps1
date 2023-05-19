Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]


$BoomForm=New-Object $FormObject
$BoomForm.ClientSize='500,300'
$BoomForm.Text='Boom I.T Setups'
$BoomForm.BackColor="#878a8c"

$lbltitle=New-Object $LabelObject
$lbltitle.Text='VLC'
$lbltitle.AutoSize=$true
$lbltitle.Location=New-Object System.Drawing.Point(120,20)
$lbltitle.Font='Verdana,24,style=Bold'

$btnVLC=New-Object $ButtonObject
$btnVLC.Text='Install VLC'
$btnVLC.AutoSize=$true
$btnVLC.Font='Verdana,24,style=Bold'
$btnVLC.Location=New-Object System.Drawing.Point(150,150)


$BoomForm.Controls.AddRange(@($lbltitle, $btnVLC))

#Function Logic

function TextToggle{
    if($lbltitle.Text -eq ''){
        $lbltitle.Text="Install VLC" 
    } else {
        $lbltitle.Text=''
    }
}

#Function Implimentation
$btnVLC.Add_Click({TextToggle})


$BoomForm.ShowDialog()

$BoomForm.Dispose()