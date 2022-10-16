#Naveen.S
#region Set logging 
$logFile = "c:\windows\temp\" + (get-date -format 'yyyyMMdd') + '_AIBApplicationinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion


#install JRE
Write-host 'AIB Customization: Install JRE'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\JRE\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "JRE installed successfully"
    write-host "JRE installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing JRE: $ErrorMessage"
    write-host "Error installing JRE: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: EndRegion JRE'


#install AIP
Write-host 'AIB Customization: Install AIP'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\AIP\DistributionFiles\Windows\Microsoft AIP 2.13.49\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "AIP installed successfully"
    write-host "AIP installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing AIP: $ErrorMessage"
    Write-host "Error installing AIP: $ErrorMessage"
}
#endregion


#install Netclean
Write-host 'AIB Customization: Install NetClean'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\Netclean\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Netclean installed successfully"
    write-host "Netclean installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Netclean: $ErrorMessage"
    write-host "Error installing Netclean: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: endregion NetClean'


#install TNS_names
Write-host 'AIB Customization: Install TNS_Names'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\TNS_names\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "TNS_names installed successfully"
    write-host "TNS_names installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing TNS_names: $ErrorMessage"
    write-host "Error installing TNS_names: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: endregion TNS_Names'


#install Bomgar
Write-host 'AIB Customization: Install Bomgar'
try {
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVD_SD_Apps\Bomgar\o\bomgar-scc-win64.msi", "KEY_INFO=w0gdc30y87ej6857zy761jj5x8h8j858e1wi7zec408c90", '/qn','/l*v',  "C:\Windows\Temp\Bomgar-INSTALL.log"
    write-log "TNS_names installed successfully"
    write-host "TNS_names installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing TNS_names: $ErrorMessage"
    write-host "Error installing TNS_names: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: endregion Bomgar'


Write-host 'AIB Customization: Install Lotusnotes'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\LotusNotes\DistributionFiles\Windows\HCL Lotus Notes 11.0.1\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Lotusnotes installed successfully"
    write-host "Lotusnotes installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Lotusnotes: $ErrorMessage"
    write-host "Error installing Lotusnotes: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: EndRegion Lotusnotes'


Write-host 'AIB Customization: IBM personal communication'
try {
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList "/i","`"C:\apps\AVD_SD_Apps\IBM Personal Communications 13.0.0\source\IBM Personal Communications.msi`"","TRANSFORMS=`"C:\apps\AVD_SD_Apps\IBM Personal Communications 13.0.0\source\IBM_Personnal_Communications_13.0.0.mst`"","/qn","/l*v","c:\windows\temp\ibm5.log"
    write-host "IBM personal installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    Write-host "Error installing IBM personal communication: $ErrorMessage"
}
Write-Host 'AIB customization: IBM personal communications end region'
#endregion


Write-host 'AIB Customization: IBM personal communication1'
try {
    Invoke-Expression -Command  "cmd.exe /C cscript.exe 'C:\apps\AVD_SD_Apps\IBM\a2\install.vbs'"
    write-host "IBM personal installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    Write-host "Error installing IBM personal communication: $ErrorMessage"
}
Write-Host 'AIB customization: IBM personal communications end region'
#endregion

Write-host 'AIB Customization: IBM personal communication2'
try {
    Invoke-Expression -Command  "cmd.exe /C cscript.exe 'C:\apps\AVD_SD_Apps\IBM\a3\install.vbs'"
    write-host "IBM personal installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    Write-host "Error installing IBM personal communication: $ErrorMessage"
}
Write-Host 'AIB customization: IBM personal communications end region'
#endregion


#install Umbrella
Write-host 'AIB Customization: Install Umbrella'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\Umbrella\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Umbrella installed successfully"
    write-host "Umbrella installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Umbrella: $ErrorMessage"
    write-host "Error installing Umbrella: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: endregion umbrella'

#install VCC_Fonts
Write-host 'AIB Customization: Install vcc_fonts'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\VCC_Fonts\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "VCC_Fonts installed successfully"
    write-host "VCC_Fonts installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing VCC_Fonts: $ErrorMessage"
    write-host "Error installing VCC_Fonts: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: endregion vccfonts'

#install VCC_Templates
Write-host 'AIB Customization: Install templates'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\VCC_Templates\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "VCC_Templates installed successfully"
    write-host "VCC_Templates installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing VCC_Templates: $ErrorMessage"
    write-host "Error installing VCC_Templates: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: endregion templates'

#install #StartMenu
try {
    Import-StartLayout -LayoutPath "C:\apps\AVD_SD_Apps\StartMenu\VCC-StartM.bin" -MountPath $env:SystemDrive\
    write-log "Start menu layout successfully"
    write-host "Start menu layout successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error setting up start menu: $ErrorMessage"
}
#end region.

#Laps
Write-host 'AIB Customization: Install Laps'
try {
    
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVD_SD_Apps\LAPS\Laps.x64.msi", TRANSFORMS="C:\apps\AVD_SD_Apps\LAPS\LAPS_6.2.0.0.mst" , '/qn','/l*v',  "C:\Windows\Temp\Local_Admin_Password_Solution_6.2.0.0_EN_x64_M1-INSTALL.log"
    Write-Log "successfully installed Laps"
    Write-host 'successfully installed Laps'

    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installed laps: $ErrorMessage"
    write-host "Error installed laps: $ErrorMessage"
}
#end region.
Write-host 'AIB Customization: endregion Laps'
#install Java
Write-host 'AIB Customization: Install Java'
try {
    
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVD_SD_Apps\Java_8\source\jre1.8.0_72.msi", TRANSFORMS="C:\apps\AVD_SD_Apps\Java_8\source\Java_8_Update_72_x86_8.0.720.15_W10.mst" , '/qn','/l*v',  "C:\Windows\Temp\Java-INSTALL.log"
    Write-Log "successfully installed Java"
    Write-host "successfully installed Java"

    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installed Java: $ErrorMessage"
    Write-Log "Error installed Java: $ErrorMessage"
}

#endregion Java
Write-host 'AIB Customization: endregion Laps'
#Onboard Windows Defender ATP.
Write-host 'AIB Customization: Configure Defender ATP'
try{
$dir='C:\WINDOWS\System32\GroupPolicy\Machine\Scripts\Startup'
New-Item -Path $dir -ItemType Directory -force
Copy-Item -path "c:\apps\AVD_SD_Apps\Onboard ATP\Onboard-NonPersistentMachine.ps1" -Destination $dir
write-log "Error copying Onboard-NonPersistentMachine : success" 
}
catch{
    $ErrorMessage = $_.Exception.message
    write-log "Error copying Onboard-NonPersistentMachine : $ErrorMessage" 
    write-host "Error copying Onboard-NonPersistentMachine : $ErrorMessage" 
}
try {
    Copy-Item -path "c:\apps\AVD_SD_Apps\Onboard ATP\WindowsDefenderATPOnboardingScript.cmd" -Destination $dir
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error copying WindowsDefenderATPOnboardingScript : $ErrorMessage" 
    write-host "Error copying WindowsDefenderATPOnboardingScript : $ErrorMessage" 
}
#endregion of defender ATP.
Write-host 'AIB Customization: endregion defender ATP'

#install optimized teams.
Write-host 'AIB Customization: install optimized teams'

try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\AVDTeams\DistributionFiles\Windows\Microsoft Teams for AVD 1.5\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "AVD Teams installed successfully."
    write-host "AVD Teams installed successfully."
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing AVD Teams: $ErrorMessage"
    write-host "Error installing AVD Teams: $ErrorMessage"
}
#endregion of teams.
Write-host 'AIB Customization: endregion optimized teams'

#endregion SAP



#install SAP 
Write-host 'AIB Customization: Install SAP'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\SAP\DistributionFiles\Windows\SAP GUI 7.6 P8\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "SAP installed successfully"
    write-host "SAP installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing SAP: $ErrorMessage"
    write-host "Error installing SAP: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion SAP'
#endregion SAP

#install VCC wallpaper
Write-host 'AIB Customization: Configure Wallpaper'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\VCC_Wallpaper\Deploy-Application.exe" -Wait -ErrorAction Stop 
    Start-Sleep -Seconds 5
    write-log "VCC Wallpaper successfully"
    write-host "VCC Wallpaper successfully"
    New-Item -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Force
    set-itemproperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name LockScreenImage -Value "C:\windows\Themes\VCCWallpaper\Default.jpg"
    write-log "VCC Wallpaper & lockscreen configured successfully."
    write-host "VCC Wallpaper & lockscreen configured successfully."
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error setting wallpaper: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: endregion Wallpaper'


