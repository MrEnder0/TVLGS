#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

Gui, 1:-Caption
Gui, 1:Add, Button, x10 y+5 w120 default, Start
Gui, 1:Add, button, x10 y+5 w120 gabout, About
Gui, 1:Add, Button, x10 y+5 w120 gOptions, Options
Gui, 1:Add, Button, x10 y+5 w120 gcancel, Exit
Gui, 1:Add, Picture, w120 h80, media/TetoBanner.png
Gui, 1:Show, w140 h205, Teto Voice Launch Gear System (TLGVS)

Gui, 1:-SysMenu
Gui, 1:Add, Button, x10 y+5 w120 gBack, Minimize
Gui, 1:Add, Text, x10 y+5 w120, Select your landing gear keybind
Gui, 1:Add, DropDownList, vInputChoice, a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|1|2|3|4|5|6|7|8|9|0
Gui, 1:Add, Text, x10 y+5 w120, Choose your minimum activation delay
Gui, 1:Add, Edit, x10 y+5 w120 vMinDelay, 4000
Gui, 1:Show, w140 h205, Teto Voice Launch Gear System (TLGVS)
return

about() {
    GuiControlGet, InputChoice ,,vInputChoice,
    GuiControlGet, InputChoice 
    MsgBox Teto Voice Launch Gear System (TLGVS)`n`nDeveloper: MrEnder`nCommissioner: Heliodor`nMade in: February 2023`nVersion: 1.1`n`nHow to use: When application is started make sure to select your keybind for your landing gear that you have aLso set in game. When that is selected make sure to click start.`n`nHow to close: To exit go to your icon tray on the bottom right of your screen your icon tray should be an up arrow. On that tray you can find the app to close it right click and select "Exit".`n`nVoiceline desync issue: Make sure you are not pressing your landing gear key while not being in the ship or it will false detect it and desync the voice lines with what is actually happening.
}

cancel() {
    ExitApp
}

Options:
Gui, 1:Hide
Gui, 1:Show, w140 h405, Teto Voice Launch Gear System Settings
Return

Back:
Gui, 1:Hide
Gui, 1:Show, w140 h205, Teto Voice Launch Gear System (TLGVS)
Return

ButtonStart:
Gui, Submit 

GearDown = 1
Loop {
    KeyWait, %InputChoice%, D
    if (GearDown = 0) {
        SoundPlay, sounds/GearDown.mp3
        Sleep, 1000
        GearDown = 1
    }
    else {
        SoundPlay, sounds/GearUp.mp3
        Sleep, 1000
        GearDown = 0
    }
    sleep, %vMinDelay%
}
ExitApp