#install AIP
Write-host 'AIB Customization: Install AIP'
try {
    Start-Process -filepath "C:\apps\AVDapps\AIP\Deploy-Application.exe" -Wait -ErrorAction Stop 
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
