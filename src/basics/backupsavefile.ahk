DetectAndBackupFile(file, backupDir) {
    Loop {
        Log("Checking if backup is needed")
        FileGetTime, mod_time, %file%
        if (mod_time > last_mod_time) {
            Log("lets backup that file.")
            last_mod_time := mod_time
            FileCopy, %file%, %backupDir%\example_backup.eu4
            FormatTime, timestamp, %A_Now%, ss_mm_HH___dd_MM_yyyy
            new_file_name := "Backup_File_" . timestamp . ".eu4"
            FileMove, %backupDir%\example_backup.eu4, %backupDir%\%new_file_name%
            ; the %A_Now% variable adds the current date and time to the filename
            Sleep, 100
            FileDelete, %backupDir%\example_backup.eu4
        }
        Sleep, settings["backupInterval"] ; wait set amount of time before checking
    }
}