@echo off
:inicio
cls
echo ###
echo Script para automatizacion de procesos en Soporte informatico
echo creado por Leonardo MV
echo ####
SET var=0
echo  [1]    Respaldar drivers   
echo  [2]    Restaurar copia de drivers
echo  [3]    Eliminar respaldo
echo  [4]    Ver activacion
echo  [5]    Ver BIOS
echo  [6]    Ver Licencia de windows
echo  [7]    Informacion completa de SO
echo  [8]    Ver clave wifi
echo  [9]	 Desactivar Windows Defender
echo  [10]	 Activar Windows Defender
echo  [11]   Salir
SET /p var= ^> Seleccione una opcion [1-9]: 
cls
echo.
if %var%==1 goto op1 
if %var%==2 goto op2
if %var%==3 goto op3 
if %var%==4 goto op4
if %var%==5 goto op5
if %var%==6 goto op6
if %var%==7 goto op7
if %var%==8 goto op8
if %var%==9 goto op9
if %var%==10 goto op10
if %var%==11 goto op11
:op1
echo.
echo Se creara la carpeta "Drivers" en carpeta raiz
md %HOMEDRIVE%\Drivers
echo.
echo Se respaldaran drivers a carpeta "Drivers"
echo.
dism /online /export-driver /destination:%HOMEDRIVE%\Drivers
echo.
echo Respaldo realizado con exito!
pause
cls
goto inicio
:op2
echo.
echo Bien!!
dism /online /Add-Driver /Driver:%HOMEDRIVE%\Drivers /Recurse
echo.
echo Respaldo restaurado exitosamente
echo.
pause
cls
goto inicio
:op3
echo.
echo Se eliminara el respaldo ...
echo.
SET /p var2= ^> Estas seguro de eliminar respaldo de drivers? s/n: 
if %var2%==s goto si
if %var2%==n goto no
:si
echo.
echo Se eliminara el respaldo ...
RD %HOMEDRIVE%\Drivers /S /Q
echo.
echo Respaldo eliminado exitosamente
echo.
pause
goto inicio
:no
cls
echo.
echo Operacion cancelada
pause
goto inicio
:op4
cls
echo Se abrira una ventana emergente con la informacion...
slmgr.vbs /xpr
pause
goto inicio
:op5 
echo Se creara un archivo con la informacion de la BIOS
echo ############################################# >> %USERPROFILE%\Desktop\info.txt
echo #######  Informacion de la BIOS   ########### >> %USERPROFILE%\Desktop\info.txt
echo ############################################# >> %USERPROFILE%\Desktop\info.txt
systeminfo | findstr /I /c:bios >> %USERPROFILE%\Desktop\info.txt
pause
goto inicio
:op6
echo Realizando busqueda....
echo ############################################# >> %USERPROFILE%\Desktop\info.txt
echo #######  Codigo de Licencia de Windows ###### >> %USERPROFILE%\Desktop\info.txt
echo ############################################# >> %USERPROFILE%\Desktop\info.txt
wmic path softwarelicensingservice get OA3xOriginalProductKey >> %USERPROFILE%\Desktop\info.txt
pause
goto inicio
:op7
echo Buscando informacion...
echo ############################################# >> %USERPROFILE%\Desktop\info.txt
echo ####### Informaicon completa de sistema ##### >> %USERPROFILE%\Desktop\info.txt
echo ############################################# >> %USERPROFILE%\Desktop\info.txt
systeminfo >> %USERPROFILE%\Desktop\info.txt
pause
goto inicio
:op8
echo ingrese el SSID, se guardara en \info.txt
SET /p var1= ^> SSID Wifi:
echo ################################################### >> %USERPROFILE%\Desktop\info.txt
echo #######      Contraseña WIFI %var1% ######## >> %USERPROFILE%\Desktop\info.txt
echo ################################################### >> %USERPROFILE%\Desktop\info.txt
netsh WLAN show profile name="%var1%" key=clear >> %USERPROFILE%\Desktop\info.txt
pause
goto inicio
:op9
cls
echo copia y pega en powershell para desactivar
start powershell
echo Set-MpPreference -DisableRealtimeMonitoring $true; exit
pause
goto inicio
:op10
cls
echo copia y pega en powershell para activar
start powershell
echo Set-MpPreference -DisableRealtimeMonitoring $false; exit
pause
goto inicio
:op11
cls
echo Pulsa una tecla para salir 
pause>nul
exit
