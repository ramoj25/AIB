#Naveen.S
#region Set logging 
$logFile = "c:\apps\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#install AIP
try {
    Start-Process -filepath "C:\apps\AVDapps\AIP\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "AIP installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing AIP: $ErrorMessage"
}
#endregion

#install JRE
try {
    Start-Process -filepath "C:\apps\AVDapps\JRE\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "JRE installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing JRE: $ErrorMessage"
}
#endregion

#install Netclean
try {
    Start-Process -filepath "C:\apps\AVDapps\Netclean\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Netclean installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Netclean: $ErrorMessage"
}
#endregion


#install O365
try {
    Start-Process -filepath "C:\apps\AVDapps\O365\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "O365 installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing O365: $ErrorMessage"
}
#endregion

#install Office
try {
    Start-Process -filepath "C:\apps\AVDapps\Office\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Office installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Office: $ErrorMessage"
}
#endregion

#install TNS_names
try {
    Start-Process -filepath "C:\apps\AVDapps\TNS_names\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "TNS_names installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing TNS_names: $ErrorMessage"
}
#endregion

#install Umbrella
try {
    Start-Process -filepath "C:\apps\AVDapps\Umbrella\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Umbrella installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Umbrella: $ErrorMessage"
}
#endregion

#install VCC_Fonts
try {
    Start-Process -filepath "C:\apps\AVDapps\VCC_Fonts\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "VCC_Fonts installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing VCC_Fonts: $ErrorMessage"
}
#endregion

#install VCC_Templates
try {
    Start-Process -filepath "C:\apps\AVDapps\VCC_Templates\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "VCC_Templates installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing VCC_Templates: $ErrorMessage"
}
#endregion

#install Email_signature
try {
    Start-Process -filepath "C:\apps\AVDapps\Email_signature\Deploy-Application.exe" -ErrorAction Stop 
    write-log "Email_signature installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Email_signature: $ErrorMessage"
}
#endregion
