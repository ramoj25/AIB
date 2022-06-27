
#region Set logging 
$logFile = "c:\temp\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#install JRE
try {
    Start-Process -filepath "C:\Temp\jre\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "JRE installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing vccwallpaper: $ErrorMessage"
}
#endregion

#install 
