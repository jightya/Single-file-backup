;include these please
#Include init.ahk
settingsFile := "settings.ini"

; some basic stuff
setVars()

; some logging
runLogFile := settings["runLogFile"]
scriptName := "Backup file if changed."
Log("Started " scriptName "...")  

; the script itself
while 1 {
    MsgBox, This program will run continously. To stop it, press CTRL+END
    DetectAndBackupFile(settings["file"], settings["backupDir"])
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off