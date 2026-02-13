# Windows Monitor Profile Switcher

This project contains a set of batch scripts designed to handle complex monitor transitions 
(e.g., switching between a Triple-Monitor desk setup and a Single-Monitor 4K TV/Bed setup).

## Prerequisites
1. MultiMonitorTool.exe (Free utility from NirSoft)
2. Windows 10 or 11

## Installation
1. Download MultiMonitorTool.exe and place it in the same folder as these scripts.
2. Manually set up your monitors for "All" (Triple) and "TV" (TV Only) modes. (for further explanation, these batch files are set up specifically for my monitor layout preferences. From left to right, I have a 4k tv, gaming monitor, gaming monitor. These two batch profiles allow me to quickly enable or disable my gaming monitors. When the gaming monitors are enabled, the left-most gaming monitor is also assigned 'Primary'.)
3. Use MultiMonitorTool's "Save Monitors Config" (Ctrl+S) to create:
   - All.cfg
   - TV.cfg
4. Open the .bat files in a text editor.
5. Find your Monitor IDs by running `MultiMonitorTool.exe /sxml` and update the 
   variables at the top of the scripts.

## Functional Details
The scripts use a "State-Verification" approach:
1. They reset the hardware state by loading the "All" config first.
2. They move the 'Primary Display' tag to the target monitor while all screens are on.
3. They wait for Windows to finish moving the taskbar and UI elements.
4. They disable unnecessary monitors only AFTER the primary focus is secured.

## Troubleshooting
Common errors I faced when configuring were around activating/de-activating monitors WHILE primary display setting was being changed. Thus I added the redundancy for both batch files. I am sure the process can be streamlined further but I am new to this and already spent 4 hours on these 3 files