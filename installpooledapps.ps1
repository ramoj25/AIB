#Naveen.S
#region Set logging 
$logFile = "c:\windows\temp\" + (get-date -format 'yyyyMMdd') + '_AIBApplicationinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#install AIP
Write-host 'AIB Customization: Install AIP'
try {
    Start-Process -filepath "C:\apps\AVDapps\AIP\DistributionFiles\Windows\Microsoft AIP 2.13.49\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "AIP installed successfully"
    write-host "AIP installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing AIP: $ErrorMessage"
    Write-host "Error installing AIP: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: EndRegion AIP'
#install JRE
Write-host 'AIB Customization: Install JRE'
try {
    Start-Process -filepath "C:\apps\AVDapps\JRE\Deploy-Application.exe" -Wait -ErrorAction Stop 
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
#install Netclean
Write-host 'AIB Customization: Install NetClean'
try {
    Start-Process -filepath "C:\apps\AVDapps\Netclean\Deploy-Application.exe" -Wait -ErrorAction Stop 
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
    Start-Process -filepath "C:\apps\AVDapps\TNS_names\Deploy-Application.exe" -Wait -ErrorAction Stop 
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

#install Umbrella
Write-host 'AIB Customization: Install Umbrella'
try {
    Start-Process -filepath "C:\apps\AVDapps\Umbrella\Deploy-Application.exe" -Wait -ErrorAction Stop 
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
    Start-Process -filepath "C:\apps\AVDapps\VCC_Fonts\Deploy-Application.exe" -Wait -ErrorAction Stop 
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
    Start-Process -filepath "C:\apps\AVDapps\VCC_Templates\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "VCC_Templates installed successfully"
    write-host "VCC_Templates installed successfully"
    New-Item -path "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\16.0\Common\General\" -Name 'sharedtemplates' -Force
    set-itemproperty "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\16.0\Common\General\" -Name sharedtemplates -Value "C:\ProgramData\Microsoft\Windows\Corporate Templates"
    write-log "VCC_Templates added to registry successfully"
    write-host "VCC_Templates added to registry successfully"
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
    Import-StartLayout -LayoutPath "C:\apps\AVDapps\StartMenu\VCC-StartM.bin" -MountPath $env:SystemDrive\
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
    
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVDapps\LAPS\Laps.x64.msi", TRANSFORMS="C:\apps\AVDapps\LAPS\LAPS_6.2.0.0.mst" , '/qn','/l*v',  "C:\Windows\Temp\Local_Admin_Password_Solution_6.2.0.0_EN_x64_M1-INSTALL.log"
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
    
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVDapps\Java_8\source\jre1.8.0_72.msi", TRANSFORMS="C:\apps\AVDapps\Java_8\source\Java_8_Update_72_x86_8.0.720.15_W10.mst" , '/qn','/l*v',  "C:\Windows\Temp\Java-INSTALL.log"
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
Copy-Item -path "c:\apps\AVDapps\Onboard ATP\Onboard-NonPersistentMachine.ps1" -Destination $dir
write-log "Copying Onboard-NonPersistentMachine : success" 
}
catch{
    $ErrorMessage = $_.Exception.message
    write-log "Error copying Onboard-NonPersistentMachine : $ErrorMessage" 
    write-host "Error copying Onboard-NonPersistentMachine : $ErrorMessage" 
}
try {
    Copy-Item -path "c:\apps\AVDapps\Onboard ATP\WindowsDefenderATPOnboardingScript.cmd" -Destination $dir
    write-log "Copying atponboardingscript.cmd"
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
    Start-Process -filepath "C:\apps\AVDapps\AVDTeams\DistributionFiles\Windows\Microsoft Teams for AVD 1.5\Deploy-Application.exe" -Wait -ErrorAction Stop 
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

#install VCC wallpaper
Write-host 'AIB Customization: Configure Wallpaper'
try {
    Start-Process -filepath "C:\apps\AVDapps\VCC_Wallpaper\DistributionFiles\Windows\VCC Desktop Wallpaper 2210\Deploy-Application.exe" -Wait -ErrorAction Stop 
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

#install Chrome
Write-host 'AIB Customization: Install Chrome'
try {
    Start-Process -filepath "C:\apps\AVDapps\Google Chrome 90.0.4430.212\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Chrome installed successfully"
    write-host "Chrome installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Chrome: $ErrorMessage"
    write-host "Error installing Chrome: $ErrorMessage"
}
Write-host 'AIB Customization: endregion chrome'

#install AVDBG
Write-host 'AIB Customization: Install AVDBG'
try {
  Start-Process -filepath "C:\apps\AVDapps\AVDBG\DistributionFiles\Windows\VCC Teams Video Backgrounds Global Brand Campaign 2210\Deploy-Application.exe" -Wait -ErrorAction Stop
    }
catch {
    $ErrorMessage = $_.Exception.message
    
    write-host "Error AVDBG: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion AVDBG'
#endregion AVDBG 

#install Notepadd
Write-host 'AIB Customization: Install Notepadd'
try {
  Start-Process -filepath "C:\apps\AVDapps\Notepad++\DistributionFiles\Windows\Open Software Notepad++ 8.4\Deploy-Application.exe" -Wait -ErrorAction Stop
    }
catch {
    $ErrorMessage = $_.Exception.message
    
    write-host "Error Notepadd: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion Notepadd'
#endregion Notepadd 

#install Putty
Write-host 'AIB Customization: Install Putty'
try {
 Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVDapps\Putty\OriginalFiles\putty-64bit-0.74-installer.msi", '/qn','/l*v',  "C:\Windows\Temp\Putty-INSTALL.log"
    }
catch {
    $ErrorMessage = $_.Exception.message
    
    write-host "Error Putty: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion Putty'
#endregion Putty 



#removal of inbuilt applications.
try{
$appxpackage =
"Microsoft.3DBuilder,
Microsoft.Getstarted,
Microsoft.MicrosoftOfficeHub,
Microsoft.MicrosoftSolitaireCollection,
Microsoft.People,
Microsoft.SkypeApp,
Microsoft.WindowsCommunicationsApps,
Microsoft.XboxApp,
Microsoft.ZuneMusic,
Microsoft.ZuneVideo,
Microsoft.BingFinance,
Microsoft.BingNews,
Microsoft.BingSports,
Microsoft.BingWeather,
Microsoft.Windows.Photos,
Microsoft.WindowsMaps,
Microsoft.YourPhone,
Microsoft.WindowsSoundRecorder,
Microsoft.WindowsAlarms,
Microsoft.GetHelp,
Microsoft.Microsoft3Dviewer,
Microsoft.Messaging,
Microsoft.MixedReality.Portal,
Microsoft.WindowsFeedbackHub,
Microsoft.Wallet,
Microsoft.Print3D"
$appxpackage=$appxpackage.Split(",")
foreach ($appx in $appxpackage) {Get-AppxPackage $appx | Remove-AppxPackage -AllUsers}
}
catch{
$ErrorMessage = $_.Exception.message
    write-host "Error removing builtin apps: $ErrorMessage"
}
write-host  "AIB: removal of applications"
#endregion of inbuilt applications.



