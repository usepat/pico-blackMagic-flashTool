# RP-Pico Black Magic Flash Tool
Tool to support autonomous flashing of .uf2-binary to RP2040/Pico without using hardware reset button. Available for Windows and Linux.

## How To Use Flash Tool on Linux
1) Save `picoFlashTool_Linux.sh` into your bin- or any other folder where the .uf2-file (which you want to copy to pico) is located. Note that ONLY ONE .uf2-file shall be available inside the folder, otherwise, probably the wrong file is loaded onto pico/rp2040
![image](https://user-images.githubusercontent.com/110904384/208932823-8a7dfceb-6da5-46d2-b502-a68919c6da17.png)

2) Connect your pico and check if it has mounted
   - If there is already firmware on pico enter `$ sudo dmesg | grep tty` and check on which serial-port it has mounted (`ttyACM0` in this case).
    
    ![image](https://user-images.githubusercontent.com/110904384/208932260-d2ba8cc3-b5f9-43b6-954e-f1e3a80ffdda.png)

   - If there is no firmware on pico it will be mounted as USB mass storage device (check out your file explorer). Simply drag and drop the .uf2-file manually. The Shell-script won't work in this case. 
   
3) Open Terminal and navigate to the folder where the .uf2 and the Shell-Script are located.

   ![image](https://user-images.githubusercontent.com/110904384/208933094-f980ba26-048c-4bc2-8cf4-acdf39c8cbad.png)

4) Execute the Shell-script with the following command (replace the serial-port with yours)
   
    `$ ./picoFlashTool_Linux ttyACM0`

   ![image](https://user-images.githubusercontent.com/110904384/208934065-46b5a75a-fed1-4da5-a700-927763251dfb.png)

NOTE: If permission for execution of the flash-tool is denied, use `$ sudo chmod +x picoFlashTool_Linux`
    
5) Done!




## How To Use Flash Tool on Windows
1) Save picoFlashTool_WinPS.ps1 into your bin- or any other folder where the .uf2-file (which you want to copy to pico) is located. Note that ONLY ONE .uf2-file shall be available inside the folder, otherwise, probably the wrong file is loaded onto pico/rp2040!
![image](https://user-images.githubusercontent.com/110904384/208679336-c45725ec-71af-422a-8f11-4f213e0181f6.png)

2) Connect your pico and check if it has mounted
   - If there is already firmware on pico go to device manager and check on which COM-port it has mounted (`COM6` in this case).
   
   ![image](https://user-images.githubusercontent.com/110904384/208672132-c6fb5251-3c28-40d9-8eb4-0dcabc19ccd9.png)
   - If there is no firmware on pico it will be mounted as USB mass storage device (check out your file explorer). Simply drag and drop the .uf2-file manually. The PowerShell-script won't work in this case. 

3) Open PowerShell and navigate to the folder where the .uf2 and the PowerShell-Script are located.
![image](https://user-images.githubusercontent.com/110904384/208679669-3f9a24d6-b09c-4bb6-97e9-0144063329c6.png)
   
4) Execute the PS-script with the following command (replace the COM-port with yours)
   
    `.\picoFlashTool_WinPS.ps1 COM6`

    ![image](https://user-images.githubusercontent.com/110904384/208678791-c8a31953-9b4e-4091-8f7a-6024bd64e249.png)
    
    If there occurs a warning regarding the serial interface, just ignore it. This happens because the the pico changes its device type from serial to mass storage device. 

5) Done!

## NOTE: If script could not be executed, check PS execution policy

1) Run Powershell as Administrator in the folder, where the script is located. That way you don't need to browse through folders in the command line.

You can achieve that by going into the respective folder in the windows file explorer and klick File(Datei)/Open Windows Powershell (Windows Powershell öffnen)/Open WIndows Powershell as Administrator (Windows Powershell als Admin öffnen)

2) run the following command in Powershell: `Set-ExecutionPolicy -ExecutionPolicy Bypass` -> and confirm with yes

3) now try to run the script again
