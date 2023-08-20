
Write-Host "Update Required! Press any Key To Continue..." -ForegroundColor Green
$x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host "Updating Please Wait..."
Invoke-WebRequest -Uri https://raw.githubusercontent.com/wendys2445/CoTW/main/ResetGui.ps1 -OutFile C:\Users\Public\CoTWPopulationResetFiles\ResetGuiNew.ps1
Remove-Item C:\Users\Public\CoTWPopulationResetFiles\ResetGui.ps1
Rename-Item -Path "C:\Users\Public\CoTWPopulationResetFiles\ResetGuiNew.ps1" -NewName "C:\Users\Public\CoTWPopulationResetFiles\ResetGui.ps1"
Get-Process
for ($i = 1; $i -le 100; $i++ ) {
    Write-Progress -Activity "Updating" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 15
}
Write-Host "Update Complete! Press Any key To Continue and then relaunch the script to use." -ForegroundColor Green
$x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Exit
