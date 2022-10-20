#Naveen.S
#region Set logging 
$logFile = "c:\windows\temp\" + (get-date -format 'yyyyMMdd') + '_AIBApplicationinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#install IBM
Write-host 'AIB Customization: Install IBM'
try {
   Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList "/i","`"C:\apps\AVD_SD_Apps1\IBM\a2\source\Configuration\3270_hosts.msi`"","TRANSFORMS=`"C:\apps\AVD_SD_Apps1\IBM\a3\source\Configuration\3270_hosts.mst`"","/qn","/l*v","c:\windows\temp\3270_hosts.log"
      
    }
catch {
    $ErrorMessage = $_.Exception.message
    
    write-host "Error installing IBMa2: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion IBM'
#endregion IBM a2

#install IBM
Write-host 'AIB Customization: Install IBM'
try {
   
   Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList "/i","`"C:\apps\AVD_SD_Apps1\IBM\a2\source\cdec\cdec.msi`"","TRANSFORMS=`"C:\apps\AVD_SD_Apps1\IBM\a3\source\cdec\cdec.mst`"","/qn","/l*v","c:\windows\temp\cdec.log"
   
    }
catch {
    $ErrorMessage = $_.Exception.message
    
    write-host "Error installing IBMa2: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion IBM'
#endregion IBM a2




#install IBM
Write-host 'AIB Customization: Install IBM'
try {
   Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList "/i","`"C:\apps\AVD_SD_Apps1\IBM\a3\source\IBM Personal Communications.msi`"","TRANSFORMS=`"C:\apps\AVD_SD_Apps1\IBM\a3\source\IBM_Personnal_Communications_13.0.0.mst`"","/qn","/l*v","c:\windows\temp\ibm.log"
    }
catch {
    $ErrorMessage = $_.Exception.message
    
    write-host "Error IBM a3: $ErrorMessage"
}

Write-host 'AIB Customization: EndRegion IBM'
#endregion IBM a3


