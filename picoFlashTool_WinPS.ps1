<# powershell script for resetting and flashing rp2040 autonomously #>

<# check if rapsi has mounted as serial-device #>
echo "waiting"
while((mode $args /status) -eq $False){
   Start-Sleep -m 100
}

<# reset pico over baud rate change to 1200 baud #>
echo "resetting pico"
mode $args baud=12

<# check if rapsi has mounted as USB-device #>
while((Test-Path -Path F:\) -eq $False){
    Start-Sleep -m 500 <# sleep for 500 ms #>
}

<# copy flash-file to raspi #>
echo "initiate copying"
Copy-Item -Filter *.uf2 -Path 'C:\Users\Vanessa\Documents\flashTool' -Recurse -Destination 'F:\RPI-RP2'

echo "done"



