Add-Type -AssemblyName System.Windows.Forms
$FormObject=[System.Windows.Forms.Form]
$LabelObject=[System.Windows.Forms.Label]
$ComboBoxObject=[System.Windows.Forms.ComboBox]

# Defaults
$DefaultFont='Verdana, 14'

## Set up base form
$AppForm=New-Object $FormObject
$AppForm.ClientSize='500,300'
$AppForm.Text='Testing Dropdown'
$AppForm.BackColor='#ffffff'
$AppForm.Font=$DefaultFont

# Building the Manufacturer Options
$manufacturerLabel=New-Object $LabelObject
$manufacturerLabel.Text='Manufacturers: '
$manufacturerLabel.AutoSize=$true
$manufacturerLabel.Location=New-Object System.Drawing.Point(20,20)

$manufacturerBox=New-Object $ComboBoxObject
$manufacturerBox.Width='300'
$manufacturerBox.Location=New-Object System.Drawing.Point(140,20)

$manufacturerBox = New-Object System.Windows.Forms.ComboBox
$manufacturerBox.Location = New-Object System.Drawing.Point(50, 50)
$manufacturerBox.Width = 200

# Add items to the storeService box
$manufacturerBox.Items.AddRange(@("Lenovo", "Asus", "HP", "Nvidia", "Intel"))

# Building the storeService Options
$storeServiceLabel=New-Object $LabelObject
$storeServiceLabel.Text='Store Services: '
$storeServiceLabel.AutoSize=$true
$storeServiceLabel.Location=New-Object System.Drawing.Point(200,20)

$storeServiceBox=New-Object $ComboBoxObject
$storeServiceBox.Width='300'
$storeServiceBox.Location=New-Object System.Drawing.Point(400,20)

$storeServiceBox = New-Object System.Windows.Forms.ComboBox
$storeServiceBox.Location = New-Object System.Drawing.Point(300, 50)
$storeServiceBox.Width = 200

# Add items to the storeService box
$storeServiceBox.Items.AddRange(@("Virus Removal", "Setup With Libre", "Setup With Libre"))

# Add to View
$AppForm.Controls.AddRange(@($manufacturerLabel, $manufacturerBox, $storeServiceBox, $storeServiceLabel))

#Show the Form
$AppForm.ShowDialog()

#Garbage Collection
$AppForm.Dispose()