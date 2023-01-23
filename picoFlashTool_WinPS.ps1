<# powershell script for resetting and flashing rp2040/pico autonomously #>

<# check if rapsi has mounted as serial-device #>
echo "Wait for serial device on port $args"
$i = 0
while((mode $args /status) -eq $False){
   Start-Sleep -m 250
   $i += 1
   
   <# Abort script if no serial device co)uld be found #>
   if($i -ge 12){
        echo "No device found on serial port $args - Aborting process."
        Exit 1 
   }
}

<# reset pico over baud rate change to 1200 baud #>
echo "resetting pico"
mode $args baud=12 parity=n data=8 stop=1

<# check if pico has mounted as USB-device #>
$i = 0
$dirve = $null
$drive = $(Get-WmiObject Win32_LogicalDisk | Where-Object { $_.VolumeName -match "RPI" }).DeviceID.ToString()
while($drive -eq $null){
    echo "."
    Start-Sleep -m 250 <# sleep for 250 ms #>
    $i += 1

    <# Exit script if no usb device could be found #>
   if($i -ge 12){
        echo "No pico mass storage Pico device found - Aborting process."
        Exit 1 
   }

   $drive = $(Get-WmiObject Win32_LogicalDisk | Where-Object { $_.VolumeName -match "RPI" }).DeviceID.ToString()
}

<# copy flash-file to pico #>
echo "initiate copying"
Copy-Item -Filter *.uf2 -Path '.\' -Recurse -Destination $drive+'\RPI-RP2'

Start-Sleep -m 1000 <# give pico some time to unmount #>

<# check if flash has been successful #>
if((Test-Path -Path $drive) -eq $True){
    echo "pico was reset but could not be flashed - please drag and drop .uf2-file manually!"
}
else{ 
    echo "done"
}



