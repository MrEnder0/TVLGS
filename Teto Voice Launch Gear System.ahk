; Programmed by MrEnder
; Commissioned by Heliodor

#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; Read the settings.ini file
IniRead, InputChoiceSetting, settings.ini, Settings, InputChoiceIndex
IniRead, MinDelaySetting, settings.ini, Settings, MinDelay
IniRead, BGColorSetting, settings.ini, Settings, BGColor
IniRead, SoundPathSetting, settings.ini, Settings, SoundsPath
IniRead, MediaPathSetting, settings.ini, Settings, MediaPath

; Main gui
Gui, 1:-Caption
Gui, Color, 0x%BGColorSetting%
Gui, 1:Add, Button, x10 y+5 w120 default, Start
Gui, 1:Add, button, x10 y+5 w120 gAbout, About
Gui, 1:Add, Button, x10 y+5 w120 gOptions, Options
Gui, 1:Add, Button, x10 y+5 w120 gCancel, Exit
Gui, 1:Add, Picture, w120 h80, %MediaPathSetting%TetoBanner.png
Gui, 1:Show, w140 h205 x15 y15, Teto Voice Launch Gear System (TLGVS)

; Options gui
Gui, 1:Add, Button, x10 y+8 w120 gMain, Minimize
Gui, 1:Add, Text, x10 y+5 w120, Select your landing gear keybind
Gui, 1:Add, DropDownList, Choose%InputChoiceSetting% vInputChoice, a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|1|2|3|4|5|6|7|8|9|0|-|=|[|]|;|'|,|.|/
Gui, 1:Add, Text, x10 y+5 w120, Choose your minimum activation delay (ms.)
Gui, 1:Add, Edit, x10 y+5 w120 vMinDelay, %MinDelaySetting%
Gui, 1:Add, Button, x10 y+8 w120 gRestoreSettings, Restore Settings
return

About:
    MsgBox,
    (
    Teto Voice Launch Gear System (TLGVS)
Developer: MrEnder
Commissioner: Heliodor
Made in: February 2023
Version: 1.3.5

    How to use: When application is started make sure to select your keybind for your landing gear that you have aLso set in game. When that is selected make sure to click start.
    
    How to close: The best way to close is to press {input key} + esc + ctrl, make sure you have waited your min delay before trying to do this keybind, this will force close the app, another way to close the app is to go to your icon tray on the bottom right of your screen your icon tray should be an up arrow. On that tray you can find the app to close it right click and select "Exit".
    
    How to configure: To configure the settings for the app click "Options" the gui should expand and reveal many options that can be changed. To confirm your settings click "Minimize" and the window should restore to normal and keep your settings for the rest of the session. If you want to save your settings and have them stay inbetween sessions edit the file named "settings.ini" this file will be in the same directory as your executable.

    How to swap the sounds for the voicelines: To swap the sounds for the voice lines make sure to open up the folder that this executable in stored in you should see a subfolder named "sounds" inside of that folder you can remove the old ones and put the new ones in. Make sure they have the exact same name this includes the file extension if you dont it wont detect the sound and it wont work.
    
    Voiceline desync issue: Make sure you are not pressing your landing gear key while not being in the ship or it will false detect it and desync the voice lines with what is actually happening. If the issue is still happening make sure when you start the app that your ship is landed with all systems off and that your landing gear is down.

    How to change the background color: To change the background color of the app you can edit the file named "settings.ini" this file will be in the same directory as your executable. You can change the hex code for the background color to any color you want. Make sure to not put 0x in front of the hex code.

    How to change the banner: To change the banner you can edit the file named "settings.ini" this file will be in the same directory as your executable. You can change the path to the banner to any path you want.

    How to restore the settings: To restore the settings to default you can click "Restore Settings" in the options gui all the way at the bottom. If you do not see this make sure you have opened the options gui by clicking "Options" in the main gui.
    )
Return

Cancel:
    ExitApp
Return

Main:
Gui, 1:Show, w140 h205, Teto Voice Launch Gear System (TLGVS)
Return

Options:
Gui, 1:Show, w140 h380, Teto Voice Launch Gear System Defaults
Return

RestoreSettings:
IniWrite, 14, settings.ini, Settings, InputChoiceIndex
IniWrite, 4500, settings.ini, Settings, MinDelay
IniWrite, ECECEC, settings.ini, Settings, BGColor
IniWrite, sounds/, settings.ini, Settings, SoundsPath
IniWrite, media/, settings.ini, Settings, MediaPath

;Reload Data
IniRead, InputChoiceSetting, settings.ini, Settings, InputChoiceIndex
IniRead, MinDelaySetting, settings.ini, Settings, MinDelay
IniRead, BGColorSetting, settings.ini, Settings, BGColor
IniRead, SoundPathSetting, settings.ini, Settings, SoundsPath
IniRead, MediaPathSetting, settings.ini, Settings, MediaPath

Gui, 1:Destroy

; Main gui
Gui, 1:-Caption
Gui, Color, 0x%BGColorSetting%
Gui, 1:Add, Button, x10 y+5 w120 default, Start
Gui, 1:Add, button, x10 y+5 w120 gAbout, About
Gui, 1:Add, Button, x10 y+5 w120 gOptions, Options
Gui, 1:Add, Button, x10 y+5 w120 gCancel, Exit
Gui, 1:Add, Picture, w120 h80, %MediaPathSetting%TetoBanner.png

; Options gui
Gui, 1:Add, Button, x10 y+8 w120 gMain, Minimize
Gui, 1:Add, Text, x10 y+5 w120, Select your landing gear keybind
Gui, 1:Add, DropDownList, Choose%InputChoiceSetting% vInputChoice, a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|1|2|3|4|5|6|7|8|9|0|-|=|[|]|;|'|,|.|/
Gui, 1:Add, Text, x10 y+5 w120, Choose your minimum activation delay (ms.)
Gui, 1:Add, Edit, x10 y+5 w120 vMinDelay, %MinDelaySetting%
Gui, 1:Add, Button, x10 y+8 w120 gRestoreSettings, Restore Settings
Gui, 1:Show, w140 h205 x15 y15, Teto Voice Launch Gear System (TLGVS)
Return

ButtonStart:
Gui, Submit 

GearDown = 1
Loop {
    KeyWait, %InputChoice%, D
    ; If user holds esc and ctrl while pressing desired keybind the app will exit
    if (GetKeyState("Esc", "P") and GetKeyState("Ctrl", "P")) {
        ExitApp
    }
    if (GearDown = 0) {
        SoundPlay, %SoundPathSetting%GearDown.mp3
        Sleep, 1000
        GearDown = 1
    }
    else {
        SoundPlay, %SoundPathSetting%GearUp.mp3
        Sleep, 1000
        GearDown = 0
    }
    sleep, %MinDelay%
}
ExitApp