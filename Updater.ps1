#Notifying User of Update and asking them to continueï»¿
$programfiles = $env:ProgramFiles
Write-Host "Update Required! Press any Key To Continue..." -ForegroundColor Green
$x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host "Updating Please Wait..."
Start-Sleep -Seconds 1
#Getting most recent script from Github and replacing old script
Invoke-WebRequest -Uri https://raw.githubusercontent.com/wendys2445/CoTW/main/ResetGui.ps1 -OutFile $prgramfiles\Wendys2445\CoTWPopulationFileReset\ResetGuiNew.ps1
Invoke-WebRequest -Uri https://raw.githubusercontent.com/wendys2445/CoTW/main/Start.bat -Outfile $prgramfiles\Wendys2445\CoTWPopulationFileReset\StartNew.bat
Remove-Item $prgramfiles\Wendys2445\CoTWPopulationFileReset\ResetGui.ps1
Remove-Item $prgramfiles\Wendys2445\CoTWPopulationFileReset\Start.bat
Rename-Item -Path "$prgramfiles\Wendys2445\CoTWPopulationFileReset\ResetGuiNew.ps1" -NewName "$prgramfiles\Wendys2445\CoTWPopulationFileReset\ResetGui.ps1"
Rename-Item -Path "$prgramfiles\Wendys2445\CoTWPopulationFileReset\StartNew.bat" -NewName "$prgramfiles\Wendys2445\CoTWPopulationFileReset\Start.bat"
Get-Process
for ($i = 1; $i -le 100; $i++ ) {
    Write-Progress -Activity "Updating" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 15
}
#End of update
Write-Host "Update Complete! Press Any key To Continue and then relaunch the script to use." -ForegroundColor Green
$x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Exit
