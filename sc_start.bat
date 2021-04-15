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
:: ****************   LIVE and PTU envirovements   -  Made by Draconous   *****************
:: ********************                  3.13 AND LATER           *************************
:: ****************************************************************************************
:: *******************************    INSTRUCTIONS      ***********************************
::
:: Create folders and back up Control Mappings at "\Roberts Space Industries\Download\Controls\Mappings\" 
::
:: You will need to change the directory structure to where you installed Star Citizen.
::
:: It's not fancy and kept very simple on purpose. Do not run the .bat until control mappings are backed up *YOU WILL LOSE THEM OTHERWISE*
::
:: You can also drop this FileName.bat file in any directoy then right click it and send link to Desktop and start it from there.
::
:: ****************************************************************************************
:: *********************************    EXAMPLE    ****************************************
:: ****************************************************************************************
::
::      ~~~~~~~~~~~~
:: del "Drive:\path\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings\*.*"
::      ~~~~~~~~~~~~
::
:: *****************************************************************************************
:: *****************************************************************************************
::
::
:: *****************************************************************************************
:: ************** Put a <::> in front of the lines below after the first run ***************
:: *****************************************************************************************
::
copy /y "G:\Gaming\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings\*.*" "G:\Gaming\Roberts Space Industries\Download\Controls\Mappings\*.*"
copy /y "G:\Gaming\Roberts Space Industries\StarCitizen\LIVE\USER\Controls\Mappings\*.*" "G:\Gaming\Roberts Space Industries\Download\Controls\Mappings\*.*"
::
:: *****************************************************************************************
:: *****************************************************************************************

del /Q "G:\Gaming\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings\*.*"

del /Q "G:\Gaming\Roberts Space Industries\StarCitizen\PTU\USER\Client\0\Controls\Mappings\*.*"

copy /y "G:\Gaming\Roberts Space Industries\Download\Controls\Mappings\*.*" "G:\Gaming\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings\*.*"

copy /y "G:\Gaming\Roberts Space Industries\Download\Controls\Mappings\*.*" "G:\Gaming\Roberts Space Industries\StarCitizen\PTU\USER\Client\0\Controls\Mappings\*.*"

rmdir /s /Q "G:\Gaming\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\shaders"

rmdir /s /Q "G:\Gaming\Roberts Space Industries\StarCitizen\PTU\USER\Client\0\shaders"

"G:\Gaming\Roberts Space Industries\RSI Launcher\RSI Launcher.exe"		:: I didn't use the start command on purpose

copy /y "G:\Gaming\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings\*.*" "G:\Gaming\Roberts Space Industries\Download\Controls\Mappings\*.*"

exit 										:: this will close the command window when you exit the Launcher
