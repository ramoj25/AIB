#install AIP
Write-host 'AIB Customization: Install CarWeaver'
try {
    Start-Process -filepath "C:\apps\Systemite CarWeaver Production\Systemite CarWeaver Production\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "CarWeaver installed successfully"
    write-host "CarWeaver installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing CarWeaver: $ErrorMessage"
    Write-host "Error installing CarWeaver: $ErrorMessage"
}
#endregion
Write-host 'AIB Customization: EndRegion CarWeaver'
