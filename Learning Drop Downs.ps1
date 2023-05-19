Add-Type -AssemblyName System.Windows.Forms
$FormObject=[System.Windows.Forms.Form]
$LabelObject=[System.Windows.Forms.Label]
$ComboBoxObject=[System.Windows.Forms.ComboBox]

$AppForm=New-Object $FormObject

$AppForm.ClientSize='500,300'
$AppForm.Text='Testing Dropdown'
$AppForm.BackColor='#ffffff'


#Show the Form
$AppForm.ShowDialog()

#Garbage Collection
$AppForm.Dispose()