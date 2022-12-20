<# powershell script for resetting and flashing rp2040 autonomously #>

<# check if rapsi has mounted as serial-device #>
echo "Wait for serial device on port $args"
$i = 0
while((mode $args /status) -eq $False){
   Start-Sleep -m 250
   $i += 1
   
   <# Abort script if no serial device could be found #>
   if($i -ge 12){
        echo "No device found on port $args - Aborting process."
        Exit 1 
   }
}

<# reset pico over baud rate change to 1200 baud #>
echo "resetting pico"
mode $args baud=12 parity=n data=8 stop=1

<# check if rapsi has mounted as USB-device #>
$i = 0
while((Test-Path -Path F:\) -eq $False){
    echo "."
    Start-Sleep -m 250 <# sleep for 250 ms #>
    $i += 1

    <# Abort script if no usb device could be found #>
   if($i -ge 12){
        echo "No device found on drive F:\ - Aborting process."
        Exit 1 
   }
}

<# copy flash-file to raspi #>
echo "initiate copying"
Copy-Item -Filter *.uf2 -Path '.\' -Recurse -Destination 'F:\RPI-RP2'

Start-Sleep -m 1000 <# give pico some time to unmount #>

<# check if rapsi is still mounted as USB-device #>
if((Test-Path -Path F:\) -eq $True){
    echo "pico was reset but couldn't be flashed - please drag and drop .uf2-file manually"
}
else{ 
    echo "done"
}



