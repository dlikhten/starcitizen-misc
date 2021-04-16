@ECHO OFF
:: ****************************************************************************************
:: ****************************************************************************************
:: ********                                                                        ********
:: **                   DISCLAIMER: PLEASE READ CAREFULLY BEFORE USE.                    **
:: **        By using this file you understand that personal use and modification        **
:: **          of file contents should be done at your own discretion and risk.          **
:: ********                                                                        ********
:: ****************************************************************************************
:: ****____*____****____*____*__**____*____********************(*****(*********************
:: ***(  __(__  )  / ___(_  _/ _\(  _ (_  _)**********)********)\*)**)\*)***(*******(******
:: ****) _) / _/   \___ \ )(/    \)   / )(*********(*/(*(*****(()/(*(()/(***)\******)\*****
:: ***(____(____)  (____/(__\_/\_(__\_)(__) *******)\()))\*)***/(_)) /(_)((((_)(**(((_)****
:: ***********************************************((_)\(()/(**(_))_ (_))  )\ _ )\*)\___****
:: ***********************************************| |(_))(_))**|   \| _ \ (_)_\(_((/ __|***
:: ***********************************************| '_ | || |**| |) |   /  / _ \  | (__****
:: ***********************************************|_.__/\_, |**|___/|_|_\ /_/ \_\  \___|***
:: *****************************************************|__/*******************************
:: ****************************************************************************************
:: ****************************************************************************************
:: *****************   This file is to help with launching Star Citizen   *****************
:: *************   Automatic shader deletion and control mapping sync between   ***********
:: *************   LIVE and PTU envirovements   -  Made by Draconous / Wizywig   **********
:: ********************                  3.13 AND LATER           *************************
:: ****************************************************************************************
:: *******************************    INSTRUCTIONS      ***********************************
::
:: 1 - Change the paths in config.txt to be whatever is appropriate on your hard drive.
::     You can copy from the path part of windows explorer and just paste it into there
::
:: -   Run backup_files.bat first before doing anything otherwise you *YOU WILL LOSE THEM OTHERWISE*
::
:: right click on this file and send link to Desktop and start it from there.
::
:: ****************************************************************************************


for /f "delims=" %%x in (%~dp0/config.txt) do (set "%%x")

:: delete old mappings
del /Q "%star_citizen_path%\LIVE\USER\Client\0\Controls\Mappings\*.*"
del /Q "%star_citizen_path%\LIVE\USER\Controls\Mappings\*.*"
del /Q "%star_citizen_path%\PTU\USER\Client\0\Controls\Mappings\*.*"
del /Q "%star_citizen_path%\PTU\USER\Controls\Mappings\*.*"

:: copy all mappings over
copy /y "%backup_config_path%\Controls\Mappings\*.*" "%star_citizen_path%\LIVE\USER\Client\0\Controls\Mappings\*.*"
copy /y "%backup_config_path%\Controls\Mappings\*.*" "%star_citizen_path%\LIVE\USER\Controls\Mappings\*.*"
copy /y "%backup_config_path%\Controls\Mappings\*.*" "%star_citizen_path%\PTU\USER\Client\0\Controls\Mappings\*.*"
copy /y "%backup_config_path%\Controls\Mappings\*.*" "%star_citizen_path%\PTU\USER\Controls\Mappings\*.*"

:: delete all shaders
rmdir /s /Q "%star_citizen_path%\LIVE\USER\Client\0\shaders"
rmdir /s /Q "%star_citizen_path%\LIVE\USER\shaders"
rmdir /s /Q "%star_citizen_path%\PTU\USER\Client\0\shaders"
rmdir /s /Q "%star_citizen_path%\PTU\USER\shaders"

:: launch sc
echo "%launcher_path%\RSI Launcher.exe"
"%launcher_path%\RSI Launcher.exe"		:: I didn't use the start command on purpose

:: backup all configs on exit!
call %~dp0/backup_files.bat

:: close the darn window when you exit
:: exit
