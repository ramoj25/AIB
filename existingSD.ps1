#region Set logging 
$logFile = "c:\windows\temp\" + (get-date -format 'yyyyMMdd') + '_AIBApplicationinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
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

Write-host 'AIB Customization: Install CM4D'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\CM4D\DistributionFiles\Windows\ATS CM4D 25.0.21182 M2\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "CM4D installed successfully"
    write-host "CM4D installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing CM4D: $ErrorMessage"
    write-host "Error installing CM4D: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion CM4D'
#endregion CM4D
#install CPP client
Write-host 'AIB Customization: Install CPP client'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\CPP client\DistributionFiles\Windows\VCC CPP Client 4.0.0.1 M2\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "CPP client installed successfully"
    write-host "CPP client installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing CPP client: $ErrorMessage"
    write-host "Error installing CPP client: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion CPP client'
#endregion CPP client

#install Chrome
Write-host 'AIB Customization: Install Chrome'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\Google Chrome 90.0.4430.212\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Chrome installed successfully"
    write-host "Chrome installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Chrome: $ErrorMessage"
    write-host "Error installing Chrome: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion Chrome'
#endregion Chrome

#install Printmgr
Write-host 'AIB Customization: Install Printmgr'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\Print Manager\DistributionFiles\Windows\LRS Personal Print Manager With Pullprint 103.0.21.803\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Printmgr installed successfully"
    write-host "Printmgr installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Printmgr: $ErrorMessage"
    write-host "Error installing Printmgr: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion Printmgr'
#endregion Printmgr
#install bomgarrep
Write-host 'AIB Customization: Install Bomgarrep'
try {
    Start-Process -filepath "C:\apps\AVD_SD_Apps\bomgarrep.exe" -ArgumentList "/S" -PassThru -Wait -ErrorAction Stop 
    write-log "bomgarrep installed successfully"
    write-host "bomgarrep installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing bomgarrep: $ErrorMessage"
    write-host "Error installing bomgarrep: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion bomgarrep'
