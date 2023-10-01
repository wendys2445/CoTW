@echo off
Powershell -Command Set-ExecutionPolicy unrestricted -Scope CurrentUser
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\Users\Public\CoTWPopulationResetFiles\ResetGui.ps1'"
