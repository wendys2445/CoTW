Add-Type -AssemblyName PresentationCore,PresentationFramework
Add-Type -Assembly System.Windows.Forms

$version = "7.0"
#Getting Version number from Github Repo and comparing to onfile version number defined above
Invoke-WebRequest -Uri https://raw.githubusercontent.com/wendys2445/CoTW/main/Version.txt -OutFile C:\Users\Public\CoTWPopulationResetFiles\Versions.txt
$versionfile = "C:\Users\Public\CoTWPopulationResetFiles\Versions.txt"
$versionvalues = Get-Content $versionfile | Out-String | ConvertFrom-StringData
Write-Host "Version:"
$versionvalues.Version
#If the versions do not match the program is updated
if ($version -ne $versionvalues.Version) {
#Getting Updater script from Github Repo and Updating the Script before running
Invoke-WebRequest -Uri https://raw.githubusercontent.com/wendys2445/CoTW/main/Updater.ps1 -OutFile C:\Users\Public\CoTWPopulationResetFiles\UpdaterNew.ps1
Remove-Item C:\Users\Public\CoTWPopulationResetFiles\Updater.ps1
Rename-Item -Path "C:\Users\Public\CoTWPopulationResetFiles\UpdaterNew.ps1" -NewName "C:\Users\Public\CoTWPopulationResetFiles\Updater.ps1"
#Running Updater script
C:\Users\Public\CoTWPopulationResetFiles\Updater.ps1
Exit
}else {
#If Version numbers are equal Version text file is deleted
Remove-Item C:\Users\Public\CoTWPopulationResetFiles\Versions.txt
}





#Getting Paths for Game Exe and save game folder and defining variables with their values after transcoding to correct path as command to get does not allow for single \ as it is a escaping character.
$Pathfile = "C:\Users\Public\CoTWPopulationResetFiles\Paths.txt"
$values = Get-Content $Pathfile | Out-String | ConvertFrom-StringData
Write-Host "Getting Path To Executible..."
$values.exepath
Write-Host "Transcoding Path To Executible..."
$Path = $values.exepath.Replace('¬', '\')
$global:Path.Replace('¬', '\\')
$Pathfilesave = "C:\Users\Public\CoTWPopulationResetFiles\Savegame.txt"
$savevalues = Get-Content $Pathfilesave | Out-String | ConvertFrom-StringData
Write-Host "Getting Path To Savegame..."
$savevalues.savepath
Write-Host "Transcoding Path To Savegame..."
$savegamedir = $savevalues.savepath.Replace('¬', '\')
$global:savegamedir.Replace('¬', '\\')
Write-Host "current is $global:Path"
Write-Host "Current save folder is $savegamedir"
$PowerShellFormProject1 = New-Object System.Windows.Forms.Form
$PowerShellFormProject1.Text ='CoTW Population Reset'
$PowerShellFormProject1.Width = 330
$PowerShellFormProject1.Height = 330
$PowerShellFormProject1.AutoSize = $false
$ButtonType = [System.Windows.MessageBoxButton]::YesNo
$MessageboxTitle = “Reset Confirmation”
$Messageboxbody = “Are you sure you want to Reset Populations on these maps?”
$MessageIcon = [System.Windows.MessageBoxImage]::Warning
$ButtonType2 = [System.Windows.MessageBoxButton]::Ok
$MessageboxTitle2 = “Reset Applied”
$Messageboxbody2 = “Populations Reset”
$MessageIcon2 = [System.Windows.MessageBoxImage]::Information
$amount = 1500
$ProgressBar = New-Object System.Windows.Forms.ProgressBar
$ProgressBar.Minimum = 0
$ProgressBar.Maximum = $amount
$ProgressBar.Location = new-object System.Drawing.Size(10,260)
$ProgressBar.size = new-object System.Drawing.Size(300,20)
$PowerShellFormProject1.Controls.Add($ProgressBar)
$dialog2 = New-Object System.Windows.Forms.FolderBrowserDialog
$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Size(130,225)
$Button3.Size = New-Object System.Drawing.Size(120,23)
$Button3.Text = "Select Save Game"
$PowerShellFormProject1.Controls.Add($Button3)
$Button3.Add_Click(
{ 
$dialog2.ShowDialog()
if ($dialog2.SelectedPath -ne "") {
$global:savegamedir = $dialog2.Selectedpath
$savegamedirreplace = $savegamedir -replace '\\','¬'
 Write-Host "$savegamedirreplace"
    (Get-Content C:\Users\Public\CoTWPopulationResetFiles\Savegame.txt).Replace($saveValues.savepath, "$savegamedirreplace")|
    Set-Content C:\Users\Public\CoTWPopulationResetFiles\Savegame.txt
    Write-Host "Directory selected is $savegamedir"
    Write-Host $values.exepath


if ($values.exepath -eq "empty") {
$Button2.Enabled = $true
}
}else{
$ButtonType3 = [System.Windows.MessageBoxButton]::Ok
    $MessageboxTitle3 = “Warning”
    $Messageboxbody3 = “No File Selected”
    $MessageIcon3 = [System.Windows.MessageBoxImage]::Exclamation
    [System.Windows.MessageBox]::Show($Messageboxbody3,$MessageboxTitle3,$ButtonType3,$messageicon3)
    }
    }
)
$i=1
$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.Filter = "executibles (*.EXE)|*.EXE"
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Size(5,225)
$Button2.Size = New-Object System.Drawing.Size(120,23)
$Button2.Text = "Select Game EXE"
if ($values.exepath -eq "empty") {
$Button2.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($Button2)
$Button2.Add_Click(
{ 
$dialog.ShowDialog()
if ($dialog.FileName -ne ""){
    $global:Path = $dialog.FileName
    $savename = $Path -replace '\\','¬'
    Write-Host "$savename"
    (Get-Content C:\Users\Public\CoTWPopulationResetFiles\Paths.txt).Replace($values.exepath, "$savename")|
    Set-Content C:\Users\Public\CoTWPopulationResetFiles\Paths.txt
    Write-Host "Directory selected is $Path"
    Write-Host $values.exepath
    if ($values.exepath -eq "empty") {
    $checkbox1.Enabled = $true
    $checkbox2.Enabled = $true
    $checkbox3.Enabled = $true
    $checkbox4.Enabled = $true
    $checkbox5.Enabled = $true
    $checkbox6.Enabled = $true
    $checkbox7.Enabled = $true
    $checkbox8.Enabled = $true
    $checkbox9.Enabled = $true
    $checkbox10.Enabled = $true
    $checkbox11.Enabled = $true
    $checkbox12.Enabled = $true
    $checkbox13.Enabled = $true
    $checkbox14.Enabled = $true
    $checkbox15.Enabled = $true
    $Button.Enabled = $true
    }
    }else{
    $ButtonType3 = [System.Windows.MessageBoxButton]::Ok
    $MessageboxTitle3 = “Warning”
    $Messageboxbody3 = “No File Selected”
    $MessageIcon3 = [System.Windows.MessageBoxImage]::Exclamation
    [System.Windows.MessageBox]::Show($Messageboxbody3,$MessageboxTitle3,$ButtonType3,$messageicon3)
    }


}
)
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(5,200)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Reset"
if ($values.exepath -eq "empty") {
$Button.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($Button)
$Button.Add_Click(
{
Write-Host $Path
$confirm = [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)
Write-host "Decision: $confirm"
if ($confirm -eq "Yes") {
if((get-process "theHunterCotW_F" -ea SilentlyContinue) -eq $Null){ 
echo "Not Running" 
}
else{ 
    echo "Running"
    Stop-Process -processname "theHunterCotW_F"
 }
    if ($checkbox1.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_0" "$savegamedir"
    }
    if ($checkbox2.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_1" "$savegamedir"
    }
    if ($checkbox3.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_2" "$savegamedir"
    }
    if ($checkbox4.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_3" "$savegamedir"
    }
    if ($checkbox5.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_4" "$savegamedir"
    }
    if ($checkbox6.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_6" "$savegamedir"
    }
    if ($checkbox7.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_8" "$savegamedir"
    }
    if ($checkbox8.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_9" "$savegamedir"
    }
    if ($checkbox9.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_10" "$savegamedir"
    }
    if ($checkbox10.Checked) {
    Invoke-Expression -Command  "& '$Path'"
    }
    if ($checkbox11.Checked) {
            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_11" "$savegamedir"
    }
    if ($checkbox12.Checked) {
            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_12" "$savegamedir"
    }
    if ($checkbox13.Checked) {
            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_13" "$savegamedir"
    }
    if ($checkbox14.Checked) {
            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_14" "$savegamedir"
    }
    if ($checkbox15.Checked) {
            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_15" "$savegamedir"
    }

while($i -le $amount){
$ProgressBar.Value = $i
$i++
}
for($i = 1; $i -le $amount;$i++){}
$objForm.ShowDialog() | Out-Null
$objForm.Dispose()
[System.Windows.MessageBox]::Show($Messageboxbody2,$MessageboxTitle2,$ButtonType2,$messageicon2)
}
}
)
$CheckBox1 = New-Object System.Windows.Forms.checkbox
$CheckBox1.Left = 5; $CheckBox1.Width = 100; $CheckBox1.Top = 10
$CheckBox1.Text = "Hirschfelden"
$CheckBox1.Checked = $false
$CheckBox1.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox1.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox1)
$CheckBox2 = New-Object System.Windows.Forms.checkbox
$CheckBox2.Left = 5; $CheckBox2.Width = 100; $CheckBox2.Top = 30
$CheckBox2.Text = "Layton"
$CheckBox2.Checked = $false
$CheckBox2.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox2.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox2)
$CheckBox3 = New-Object System.Windows.Forms.checkbox
$CheckBox3.Left = 5; $CheckBox3.Width = 100; $CheckBox3.Top = 50
$CheckBox3.Text = "Medved"
$CheckBox3.Checked = $false
$CheckBox3.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox3.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox3)
$CheckBox4 = New-Object System.Windows.Forms.checkbox
$CheckBox4.Left = 5; $CheckBox4.Width = 100; $CheckBox4.Top = 70
$CheckBox4.Text = "Vurhonga"
$CheckBox4.Checked = $false
$CheckBox4.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox4.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox4)
$CheckBox5 = New-Object System.Windows.Forms.checkbox
$CheckBox5.Left = 5; $CheckBox5.Width = 100; $CheckBox5.Top = 90
$CheckBox5.Text = "Parque"
$CheckBox5.Checked = $false
$CheckBox5.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox5.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox5)
$CheckBox6 = New-Object System.Windows.Forms.checkbox
$CheckBox6.Left = 5; $CheckBox6.Width = 100; $CheckBox6.Top = 110
$CheckBox6.Text = "Yukon"
$CheckBox6.Checked = $false
$CheckBox6.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox6.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox6)
$CheckBox7 = New-Object System.Windows.Forms.checkbox
$CheckBox7.Left = 5; $CheckBox7.Width = 100; $CheckBox7.Top = 130
$CheckBox7.Text = "Cuatro"
$CheckBox7.Checked = $false
$CheckBox7.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox7.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox7)
$CheckBox8 = New-Object System.Windows.Forms.checkbox
$CheckBox8.Left = 5; $CheckBox8.Width = 100; $CheckBox8.Top = 150
$CheckBox8.Text = "SRP"
$CheckBox8.Checked = $false
$CheckBox8.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox8.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox8)
$CheckBox9 = New-Object System.Windows.Forms.checkbox
$CheckBox9.Left = 5; $CheckBox9.Width = 100; $CheckBox9.Top = 170
$CheckBox9.Text = "Te Awaroa"
$CheckBox9.Checked = $false
$CheckBox9.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox9.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox9)
$CheckBox10 = New-Object System.Windows.Forms.checkbox
$CheckBox10.Left = 130; $CheckBox10.Width = 280; $CheckBox10.Top = 200
$CheckBox10.Text = "Run Game At Completion"
$CheckBox10.Checked = $false
$CheckBox10.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox10.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox10)
$CheckBox11 = New-Object System.Windows.Forms.checkbox
$CheckBox11.Left = 105; $CheckBox11.Width = 100; $CheckBox11.Top = 10
$CheckBox11.Text = "Rancho"
$CheckBox11.Checked = $false
$CheckBox11.TabIndex = 2
if ($values.exepath -eq "empty") {
$CheckBox11.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox11)
$CheckBox12 = New-Object System.Windows.Forms.checkbox
$CheckBox12.Left = 105; $CheckBox12.Width = 100; $CheckBox12.Top = 30
$CheckBox12.Text = "Mississipi"
$CheckBox12.Checked = $false
$CheckBox12.TabIndex = 2
if ($values.exepath -eq "empty") {
$CheckBox12.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox12)
$CheckBox13 = New-Object System.Windows.Forms.checkbox
$CheckBox13.Left = 105; $CheckBox13.Width = 100; $CheckBox13.Top = 50
$CheckBox13.Text = "Revontuli"
$CheckBox13.Checked = $false
$CheckBox13.TabIndex = 2
if ($values.exepath -eq "empty") {
$CheckBox13.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox13)
$CheckBox14 = New-Object System.Windows.Forms.checkbox
$CheckBox14.Left = 105; $CheckBox14.Width = 100; $CheckBox14.Top = 70
$CheckBox14.Text = "New England"
$CheckBox14.Checked = $false
$CheckBox14.TabIndex = 2
if ($values.exepath -eq "empty") {
$CheckBox14.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox14)
$CheckBox15 = New-Object System.Windows.Forms.checkbox
$CheckBox15.Left = 105; $CheckBox15.Width = 100; $CheckBox15.Top = 90
$CheckBox15.Text = "Emerald Coast"
$CheckBox15.Checked = $false
$CheckBox15.TabIndex = 2
if ($values.exepath -eq "empty") {
$CheckBox15.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox15)


$PowerShellFormProject1.ShowDialog()
