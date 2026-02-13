@echo off
:: ==============================================================================
:: SETUP: Replace IDs below with your hardware IDs
:: ==============================================================================
set "TV_ID=YOUR_TV_ID_HERE"
set "SAM_MID=YOUR_MIDDLE_MONITOR_ID_HERE"
set "SAM_RIGHT=YOUR_RIGHT_MONITOR_ID_HERE"

set "TOOL=%~dp0MultiMonitorTool.exe"

title Phase 1: Initializing All...
%TOOL% /LoadConfig "%~dp0All.cfg"
timeout /t 2 /nobreak > nul

title Phase 2: Hijacking Primary to TV...
%TOOL% /SetPrimary "%TV_ID%"

title Phase 3: Waiting for OS migration...
timeout /t 4 /nobreak > nul

title Phase 4: Disabling Desk Monitors...
%TOOL% /Disable "%SAM_MID%" "%SAM_RIGHT%"

title Phase 5: Finalizing Bed Geometry...
%TOOL% /LoadConfig "%~dp0BedMode.cfg"
%TOOL% /SetPrimary "%TV_ID%"

exit