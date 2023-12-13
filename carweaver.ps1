#install AIP
Write-host 'AIB Customization: Install carweaver'
try {
    Start-Process -filepath "C:\apps\Systemite CarWeaver Production\Systemite CarWeaver Production\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "carweaver installed successfully"
    write-host "carweaver installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing carweaver: $ErrorMessage"
    Write-host "Error installing carweaver: $ErrorMessage"
}
#endregion
