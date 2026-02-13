@echo off
:: ==============================================================================
:: SETUP: Replace the ID below with your Middle Monitor hardware ID
:: Find yours by running: MultiMonitorTool.exe /sxml
:: ==============================================================================
set "PRIMARY_ID=YOUR_MIDDLE_MONITOR_ID_HERE"
set "TOOL=%~dp0MultiMonitorTool.exe"

title Phase 1: Waking Monitors...
%TOOL% /Enable "\\.\DISPLAY1" "\\.\DISPLAY2" "\\.\DISPLAY3"
%TOOL% /LoadConfig "%~dp0All.cfg"

title Phase 2: Setting Primary...
%TOOL% /SetPrimary "%PRIMARY_ID%"
timeout /t 3 /nobreak > nul

title Phase 3: Finalizing Triple Layout...
%TOOL% /LoadConfig "%~dp0All.cfg"

exit