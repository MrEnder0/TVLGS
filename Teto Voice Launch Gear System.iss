#define MyAppName "Teto Voice Launch Gear System"
#define MyAppVersion "1.2"
#define MyAppPublisher "Mr.Ender"
#define MyAppURL "https://github.com/MrEnder0"
#define MyAppExeName "MyProg.exe"

[Setup]
AppId={{22065F12-0231-4DA3-B696-B3ABCBEC71FC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=TVLGS Setup {#MyAppVersion}
SetupIconFile=TetoIcon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Program Files (x86)\Inno Setup 6\Examples\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Ender\Desktop\GearDown.mp3"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Ender\Desktop\GearUp.mp3"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Ender\Desktop\InvalidInput.mp3"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Ender\Desktop\Teto Voice Launch Gear System.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Ender\Desktop\TetoIcon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

