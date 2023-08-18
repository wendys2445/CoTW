Add-Type -AssemblyName PresentationCore,PresentationFramework
Add-Type -Assembly System.Windows.Forms
$filecheck = 'C:\Users\Public\CoTWPopulationResetFiles\ResetGuiNew.ps1'

#If the file does not exist, create it.
if ((Test-Path -Path $filecheck -PathType Leaf)) {
     Remove-Item C:\Users\Public\CoTWPopulationResetFiles\ResetGui.ps1
     Rename-Item -Path "C:\Users\Public\CoTWPopulationResetFiles\ResetGuiNew.ps1" -NewName "C:\Users\Public\CoTWPopulationResetFiles\ResetGui.ps1"
 }










$version = "3.0"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/wendys2445/CoTW/main/Version.txt -OutFile C:\Users\Public\CoTWPopulationResetFiles\Versions.txt
$versionfile = "C:\Users\Public\CoTWPopulationResetFiles\Versions.txt"
$versionvalues = Get-Content $versionfile | Out-String | ConvertFrom-StringData
$versionvalues.Version
if ($version -ne $versionvalues.Version) {
Invoke-WebRequest -Uri https://raw.githubusercontent.com/wendys2445/CoTW/main/ResetGui.ps1 -OutFile C:\Users\Public\CoTWPopulationResetFiles\ResetGuiNew.ps1
C:\Users\Public\CoTWPopulationResetFiles\ResetGuiNew.ps1
Exit






}















$Pathfile = "C:\Users\Public\CoTWPopulationResetFiles\Paths.txt"
$values = Get-Content $Pathfile | Out-String | ConvertFrom-StringData
$values.exepath
$Path = $values.exepath.Replace('¬', '\')
$global:Path.Replace('¬', '\\')
Write-Host "current is $global:Path"
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
$i=1
$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.Filter = "executibles (*.EXE)|*.EXE"
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Size(5,225)
$Button2.Size = New-Object System.Drawing.Size(120,23)
$Button2.Text = "Select Game EXE"
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
Write-host "$confirm"
if ($confirm -eq "Yes") {
if((get-process "theHunterCotW_F" -ea SilentlyContinue) -eq $Null){ 
echo "Not Running" 
}
else{ 
    echo "Running"
    Stop-Process -processname "theHunterCotW_F"
 }
    if ($checkbox1.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_0" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox2.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_1" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox3.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_2" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox4.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_3" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox5.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_4" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox6.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_6" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox7.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_8" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox8.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_9" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox9.Checked) {

            copy "C:\Users\Public\CoTWPopulationResetFiles\animal_population_10" ".\OneDrive\Documents\Avalanche Studios\COTW\Saves\76561199263382556\"
    }
    if ($checkbox10.Checked) {
    Invoke-Expression -Command  "& '$Path'"
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
$CheckBox1.Left = 5; $CheckBox1.Width = 280; $CheckBox1.Top = 10
$CheckBox1.Text = "Hirschfelden"
$CheckBox1.Checked = $false
$CheckBox1.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox1.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox1)
$CheckBox2 = New-Object System.Windows.Forms.checkbox
$CheckBox2.Left = 5; $CheckBox2.Width = 280; $CheckBox2.Top = 30
$CheckBox2.Text = "Layton"
$CheckBox2.Checked = $false
$CheckBox2.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox2.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox2)
$CheckBox3 = New-Object System.Windows.Forms.checkbox
$CheckBox3.Left = 5; $CheckBox3.Width = 280; $CheckBox3.Top = 50
$CheckBox3.Text = "Medved"
$CheckBox3.Checked = $false
$CheckBox3.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox3.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox3)
$CheckBox4 = New-Object System.Windows.Forms.checkbox
$CheckBox4.Left = 5; $CheckBox4.Width = 280; $CheckBox4.Top = 70
$CheckBox4.Text = "Vurhonga"
$CheckBox4.Checked = $false
$CheckBox4.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox4.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox4)
$CheckBox5 = New-Object System.Windows.Forms.checkbox
$CheckBox5.Left = 5; $CheckBox5.Width = 280; $CheckBox5.Top = 90
$CheckBox5.Text = "Parque"
$CheckBox5.Checked = $false
$CheckBox5.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox5.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox5)
$CheckBox6 = New-Object System.Windows.Forms.checkbox
$CheckBox6.Left = 5; $CheckBox6.Width = 280; $CheckBox6.Top = 110
$CheckBox6.Text = "Yukon"
$CheckBox6.Checked = $false
$CheckBox6.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox6.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox6)
$CheckBox7 = New-Object System.Windows.Forms.checkbox
$CheckBox7.Left = 5; $CheckBox7.Width = 280; $CheckBox7.Top = 130
$CheckBox7.Text = "Cuatro"
$CheckBox7.Checked = $false
$CheckBox7.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox7.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox7)
$CheckBox8 = New-Object System.Windows.Forms.checkbox
$CheckBox8.Left = 5; $CheckBox8.Width = 280; $CheckBox8.Top = 150
$CheckBox8.Text = "SRP"
$CheckBox8.Checked = $false
$CheckBox8.TabIndex = 2
if ($values.exepath -eq "empty") {
$checkbox8.Enabled = $false
}
$PowerShellFormProject1.Controls.Add($CheckBox8)
$CheckBox9 = New-Object System.Windows.Forms.checkbox
$CheckBox9.Left = 5; $CheckBox9.Width = 280; $CheckBox9.Top = 170
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
$PowerShellFormProject1.ShowDialog()
