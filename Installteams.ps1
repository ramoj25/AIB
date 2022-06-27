$path = "c:\temp"
 if([IO.Directory]::Exists($path))
{
    #Do Nothing!!
}
else
{
    #Create a temp folder for downloads
    New-Item -Type Directory -Path 'c:\' -Name "temp"
}
write-host "create logs in temp folder"


#Set the Teams Registry key
$Name = "IsWVDEnvironment"
$value = "1"
#Add Registry Path
if (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Teams")) {
    New-Item -ErrorAction Stop -Path "HKLM:\SOFTWARE\Microsoft\Teams" -Force 
}
#Add VDI Registry Value
New-ItemProperty -ErrorAction Stop -Path "HKLM:\SOFTWARE\Microsoft\Teams" -Name $name -Value $value -PropertyType DWORD -Force
write-host "Finshed registry configuration"

#Install the WebRTC redirect service
Invoke-WebRequest -uri 'https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4AQBt' -OutFile 'c:\temp\MsRdcWebRTCSvc_x64.msi'
Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i c:\temp\MsRdcWebRTCSvc_x64.msi /quiet /norestart'
write-host "downloaded webrtc and installed"

#Download the installer to the C:\temp 
Invoke-WebRequest -uri 'https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true' -OutFile 'c:\temp\Teams_windows_x64.msi'
#Install Teams
Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', 'c:\temp\Teams_windows_x64.msi', '/l*v c:\temp\teams.log', 'ALLUSER=1'
write-host "downloaded teams and installed."
