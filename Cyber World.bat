@echo off
rem SETUP
if exist usercount.bat goto vars
echo set usercount=^0>>usercount.bat
echo @echo off>>blocklist.bat



:vars
rem BATCH VARIABLES
set choice=false
call usercount.bat
set stalk=false



rem START SCREEN
:start
set choice=false
cls
title Cyber World
echo Welcome to Cyber World
echo.
if %usercount% gtr 0 echo 1.] Log-in or Register
if %usercount%==0 echo 1.] Register
echo 2.] Settings
echo 3.] Help
echo 4.] About
echo.
echo 5.] Exit
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto start
if "%choice%"=="1" if %usercount% gtr 0 goto login
if "%choice%"=="1" if %usercount%==0 goto register
if "%choice%"=="2" goto settings
if "%choice%"=="3" goto help
if "%choice%"=="4" goto about
if "%choice%"=="5" goto exit
if "%choice%"=="%choice%" goto start




rem LOGIN OR REGISTER SCREEN
:login
set choice=false
cls
title Log-in or Register
echo Log-in or Register
echo.
echo 1.] Log-in
echo 2.] Register
echo.
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto login
if "%choice%"=="1" goto login1
if "%choice%"=="2" goto register
if "%choice%"=="3" goto start
if "%choice%"=="%choice%" goto login







rem LOGIN SCREEN
:login1
set approved=false
set choice=false
set pass=false
set user=false
set wrongpass=false
set wronguser=false
cls
title Log-in
echo Log-in Your Account
echo.
echo (Leave Password and Username Blank to go Back.)
set/p user=Username:
set/p pass=Password:
if "%user%%pass%"=="falsefalse" goto login
call accs.bat
if %approved%==true goto welcome
if %approved%==false goto wrong









rem REGISTER
:register
set choice=false
set fname=false
set mname=false
set lname=false
set user=false
set pass=false
set question=false
set answer=false
set bmonth=false
set bday=false
set byear=false
set rstat=false
set gender=false
set done=false
cls
title Register
echo Register A New Account
echo.
:fname
set fname=false
set/p fname=First name:
if "%fname%"=="false" echo Please type your first name. & goto fname
set check=false
set pos=0
set number=false
:numcheck1
echo set character=%%fname:~%pos%,1%%>>var.bat
call var.bat
del var.bat
set/a check="10"+"%character%"+"0"
if not %check%==10 set number=true
set/a pos=%pos%+1
if defined character goto numcheck1
if %number%==true echo Please Enter Your First Name Using Letters Only.& goto fname
:mname
set mname=false
set/p mname=Middle name(Optional):
if not defined mname goto lname
set check=false
set pos=0
set number=false
:numcheck2
echo set character=%%mname:~%pos%,1%%>>var.bat
call var.bat
del var.bat
set/a check="10"+"%character%"+"0"
if not %check%==10 set number=true
set/a pos=%pos%+1
if defined character goto numcheck2
if %number%==true echo Please Enter Your Middle Name Using Letters Only.& goto mname
:lname
set lname=false
set/p lname=Last name:
if "%lname%"=="false" echo Please type your last name. & goto lname
set check=false
set pos=0
set number=false
:numcheck3
echo set character=%%lname:~%pos%,1%%>>var.bat
call var.bat
del var.bat
set/a check="10"+"%character%"+"0"
if not %check%==10 set number=true
set/a pos=%pos%+1
if defined character goto numcheck3
if %number%==true echo Please Enter Your Last Name Using Letters Only.& goto lname
set gender=false
echo.
echo 1.] Male
echo 2.] Female
:gender
set/p gender=Gender:
if "%gender%"=="1" set gender=Male&set done=true
if "%gender%"=="2" set gender=Female&set done=true
if "%done%"=="false" echo Please type a valid answer.& goto gender
echo.
echo Birthdate
echo.
echo 1.] January
echo 2.] February
echo 3.] March
echo 4.] April
echo 5.] May
echo 6.] June
echo 7.] July
echo 8.] August
echo 9.] September
echo 10.] October
echo 11.] November
echo 12.] December
:bmonth
set bmonth=false
set done=false
set/p bmonth=Birthmonth:
if "%bmonth%"=="1" set bmonth=January&set done=true
if "%bmonth%"=="2" set bmonth=February&set done=true
if "%bmonth%"=="3" set bmonth=March&set done=true
if "%bmonth%"=="4" set bmonth=April&set done=true
if "%bmonth%"=="5" set bmonth=May&set done=true
if "%bmonth%"=="6" set bmonth=June&set done=true
if "%bmonth%"=="7" set bmonth=July&set done=true
if "%bmonth%"=="8" set bmonth=August&set done=true
if "%bmonth%"=="9" set bmonth=September&set done=true
if "%bmonth%"=="10" set bmonth=October&set done=true
if "%bmonth%"=="11" set bmonth=November&set done=true
if "%bmonth%"=="12" set bmonth=December&set done=true
if "%done%"=="false" echo Please type your birthmonth.&goto bmonth
:bday
set bday=false
set check=10
set/p bday=Birthday(dd):
set/a check="10"+"%bday%"+"0"
if %check%==10 echo Please type a valid birthday.&goto bday
if %bday% lss 0 echo Please type a valid birthday.&goto bday
if %bday% gtr 32 echo Please type a valid birthday.&goto bday
:byear
set byear=false
set check=10
set/p byear=Birthyear(yyyy):
set/a check="10"+"%byear%"+"0"
if %check%==10 echo Please type a valid birthyear.&goto byear
if %byear% lss 1910 echo Please type a valid birthyear.&goto byear
if %byear% gtr 2018 echo Please type a valid birthyear.&goto byear
set done=false
echo.
echo 1.] Single
echo 2.] In a Relationship
echo 3.] Engaged
echo 4.] Married
echo 5.] In a Civil Union
echo 6.] In a Domestic Partnership
echo 7.] In an Open Relationship
echo 8.] It's Complicated
echo 9.] Seperated
echo 10.] Divorced
:rstat
set rstat=false
set/p rstat=Relationship Status:
if "%rstat%"=="1" set rstat=Single&set done=true
if "%rstat%"=="2" set rstat=In a Relationship&set done=true
if "%rstat%"=="3" set rstat=Engaged&set done=true
if "%rstat%"=="4" set rstat=Married&set done=true
if "%rstat%"=="5" set rstat=In a Civil Union&set done=true
if "%rstat%"=="6" set rstat=In a Domestic Partnership&set done=true
if "%rstat%"=="7" set rstat=In an Open Relationship&set done=true
if "%rstat%"=="8" set rstat=It's Complicated&set done=true
if "%rstat%"=="9" set rstat=Seperated&set done=true
if "%rstat%"=="10" set rstat=Divorced&set done=true
if "%done%"=="false" echo Please type a valid answer.&goto rstat
:setuser
set user=false
set/p user=Username:
call :symboluserfunction
if %symbol%==true echo Error! Please don't use any of the following characters: ^> ^< ^= ^^ ^"&goto setuser
if "%user%"=="false" echo Please type a username. & goto setuser
set/a check=10+%user%+1
if %check%==10 echo Spaces are not allowed. & goto setuser
:setpass
set pass=false
set/p pass=Password:
call :symbolpassfunction
if %symbol%==true echo Error! Please don't use any of the following characters: ^> ^< ^= ^^ ^"&goto setpass
if "%pass%"=="false" echo Please type a password. & goto setpass
:question
set question=false
set/p question=Recovery Question(You will use this question to recover your account incase of errors):
if "%question%"=="false" echo Please type a Recovery Question. ^& goto question
:answer
set answer=false
set/p answer=Answer to Recovery Question:
if "%answer%"=="false" echo Please type an Answer to Recovery Question. ^& goto answer




rem ACCOUNT SETUP
echo if "%%user%%%%pass%%"=="%user%%pass%" set fname=%fname%^&set mname=%mname%^&set lname=%lname%^&set bmonth=%bmonth%^&set bday=%bday%^&set byear=%byear%^&set rstat=%rstat%^&set gender=%gender%^&set approved=true>>accs.bat
echo if "%%user%%"=="%user%" set wrongpass=true>>accs.bat
echo if "%%pass%%"=="%pass%" set wronguser=true>>accs.bat
echo if "%%user%%"=="%user%" set/p answer=%question%? ^& set answered=true>>wrongpass.bat
echo if "%%answered%%"=="true" if "%%answer%%"=="%answer%" echo Your Password is %pass% ^& set answered1=true>>wrongpass.bat
echo if "%%pass%%"=="%pass%" set/p answer=%question%? ^& set answered=true>>wronguser.bat
echo if "%%answered%%"=="true" if "%%answer%%"=="%answer%" echo Your Username is %user% ^& set answered1=true>>wronguser.bat
echo set/a usercount=%usercount%+1>>usercount.bat
set/a usercount=%usercount%+1
echo if not %%block%user%%%==true if not %%blockedby%user%%%==true echo %usercount%.] %user%>>userlist.bat
echo if "%%choice%%"=="%usercount%" set userchoice=%user%^&set done=true^&set sfname=%fname% ^&set smname=%mname%^&set slname=%lname%^&set sbmonth=%bmonth%^&set sbday=%bday%^&set sbyear=%byear%^&set srstat=%rstat%^&set sgender=%gender%^& set psname=true^& set psbdate=true^& set psrs=true^& set psgender=true>>userchoice.bat
echo if %%userchoice%%==%user% set done=true^&set sfname=%fname%^&set smname=%mname%^&set slname=%lname%^&set sbmonth=%bmonth%^&set sbday=%bday%^&set sbyear=%byear%^&set srstat=%rstat%^&set sgender=%gender%^& set psname=true^& set psbdate=true^& set psrs=true^& set psgender=true>>userchoice2.bat
echo set block%user%=false>>accs.bat
echo set blockedby%user%=false>>accs.bat
echo @echo off>>%user%inbox.bat
echo set convo=^0>>%user%inboxcount.bat
echo @echo off>>%user%inboxchoice.bat
echo set blocklist=^0>>%user%blockcount.bat
echo @echo off>>%user%blockchoice.bat
echo @echo off>>%user%blocklist.bat
echo @echo off>>%user%pastblock.bat
echo @echo off>>%user%blockby.bat
echo set spname=Public^&set spbdate=Public^&set spgender=Public^&set sprstat=Public>>%user%privacy.bat
set block%user%=false
set blockedby%user%=false
goto welcome








rem ACCOUNT ERROR SCREEN
:wrong
cls
if %wrongpass%==true title Wrong Password!
if %wronguser%==true title Wrong Username!
if %wrongpass%%wronguser%==falsefalse title Account Does not Exist.
if %wrongpass%==true goto wrongpass
if %wronguser%==true goto wronguser
if %wrongpass%%wronguser%==falsefalse goto unknown




rem WRONG PASSWORD SCREEN
:wrongpass
cls
set pass=false
set choice=false
echo Wrong Password!
echo.
echo 1.] Re-type Password
echo 2.] Forgot Password
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto wrongpass
if "%choice%"=="1" goto login1
if "%choice%"=="2" goto forgotpass
if "%choice%"=="%choice%" goto wrongpass






rem FORGOT PASSWORD SCREEN
:forgotpass
cls
set answered1=false
set answered=false
set choice=false
title Forgot Password
echo Forgot Password
echo.
call wrongpass.bat
if %answered1%==false echo Wrong Answer!
set/p pause=
goto login1







rem WRONG USERNAME SCREEN
:wronguser
cls
set user=false
set choice=false
echo Wrong Username!
echo.
echo 1.] Re-type Username
echo 2.] Forgot Username
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto wronguser
if "%choice%"=="1" goto login1
if "%choice%"=="2" goto forgotuser
if "%choice%"=="%choice%" goto wronguser








rem FORGOT USERNAME SCREEN
:forgotuser
cls
set answered1=false
set answered=false
set choice=false
title Forgot Username
echo Forgot Username
echo.
call wronguser.bat
if %answered1%==false echo Wrong Answer!
set/p pause=
goto login1








rem ACCOUNT DOESNT EXIST SCREEN
:unknown
cls
set choice=false
title We Could'nt Find an Account
echo We Could'nt Find an Account
echo.
echo The Username and Password that you entered isn't
echo connected to an Account. You can Re-type your Username
echo and Password or Register a New Account.
echo.
echo 1.] Re-type Username and Password
echo 2.] Register a New Account
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto unknown
if "%choice%"=="1" goto login1
if "%choice%"=="2" goto register
if "%choice%"=="%choice%" goto unknown












rem WELCOME SCREEN
:welcome
title Welcome
cls
mode con: cols=73
set choice=false
title %user%
echo _________________________________________________________________________
echo.
echo.
echo                             Welcome, %user%
echo.
echo.
echo.
set/p pause=_________________________________________________________________________















rem MENU LOGGED IN SCREEN
:menu
cls
set choice=false
title %user% ^> Home
echo %user%
echo.
echo 1.] Profile
echo 2.] Newsfeed
echo 3.] Inbox
echo 4.] Notifications
echo 5.] Settings
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto menu
if "%choice%"=="1" goto profile
if "%choice%"=="2" goto newsfeed
if "%choice%"=="3" goto inbox
if "%choice%"=="4" goto notifs
if "%choice%"=="5" goto accsettings
if "%choice%"=="%choice%" goto menu












rem ACCOUNT SETTINGS SCREEN
:accsettings
set choice=false
title %user% ^> Home ^> Settings
cls
echo Settings
echo.
echo 1.] Privacy
echo 2.] Blocking
echo 3.] Security
echo 4.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto accsettings
if "%choice%"=="1" goto privacy
if "%choice%"=="2" goto blocking
if "%choice%"=="3" goto security
if "%choice%"=="4" goto menu
goto accsettings







rem SECURITY SETTINGS SCREEN
:security
cls
title %user% ^> Home ^> Settings ^> Security
set choice=false
cls
echo Security
echo.
echo 1.] Change Username
echo 2.] Change Password
echo 3.] Log-in Logs
echo 4.] 







rem BLOCKING SETTINGS SCREEN
:blocking
cls
title %user% ^> Home ^> Settings ^> Blocking
set choice=false
echo Blocking
echo.
echo 1.] Blocked list
echo 2.] Add Someone to Blocked list
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto blocking
if "%choice%"=="1" goto blocklist
if "%choice%"=="2" goto addblock
if "%choice%"=="3" goto accsettings
goto blocking







rem ADD BLOCK SCREEN
:addblock
cls
title %user% ^> Home ^> Settings ^> Blocking ^> Add Someone to Blocked list
set choice=false
set/a back=%usercount%+1
set done=false
set blocked=false
set blockedby=false
set userchoice=none
echo Add Someone to Blocked list
echo.
call %user%blockby.bat
call userlist.bat
echo %back%.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto inboxsettings
if "%choice%"=="%back%" goto blocking
call userchoice.bat
if %userchoice%==%user% set/p pause=You can't block yourself.& goto addblock
if %done%==false goto addblock
call blocklist.bat
if %blocked%==true goto addblock
if %blockedby%==true goto addblock
call :blockfunction&goto addblock











rem BLOCKED LIST SCREEN
:blocklist
cls
set approved=false
set blocklist=0
call %user%blockcount.bat
set/a back=%blocklist%+1
title %user% ^> Home ^> Settings ^> Blocking ^> Blocked list
set choice=false
echo Blocked list
echo.
if %blocklist%==0 echo You haven't blocked anyone yet.
call %user%blocklist.bat
echo %back%.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto blocklist
call %user%blockchoice.bat
if "%choice%"=="%back%" goto blocking
if "%approved%"=="true" goto blocklist1
goto blocklist








rem BLOCKED USER CHOICE SCREEN
:blocklist1
title %user% ^> Home ^> Settings ^> Blocking ^> Blocked list ^> %userchoice%
cls
set choice=false
echo %userchoice%
echo.
echo 1.] Unblock
echo 2.] Back
set/p choice=^>
if %symbol%==true goto blocklist
call %user%blockchoice.bat
if "%choice%"=="1" goto blocklist2
if "%choice%"=="2" goto blocklist
goto blocklist1
:blocklist2
echo if "%%user%%%%pass%%"=="%user%%pass%" set block%userchoice%=false>>accs.bat
echo if "%%user%%"=="%user%" if "%%userchoice%%"=="%userchoice%" set blocked=false>>blocklist.bat
echo if "%%user%%"=="%userchoice%" if "%%userchoice%%"=="%user%" set blockedby=false>>blocklist.bat
echo if "%%choice%%"=="%choice%" set approved=false>>%user%blockchoice.bat
echo set blockedby%user%==false>>%userchoice%blockby.bat
set block%userchoice%=false
cls
title %user% ^> Home ^> Settings ^> Blocking ^> Blocked list ^> %userchoice% ^> Successful
set/p pause=%userchoice% has been unblocked successfully.
goto blocklist








rem PRIVACY SETTINGS SCREEN
:privacy
cls
title %user% ^> Home ^> Settings ^> Privacy
set choice=false
call %user%privacy.bat
echo Privacy
echo.
echo 1.] [%spname%] Manage Name Privacy
echo 2.] [%spbdate%] Manage Birthdate Privacy
echo 3.] [%spgender%] Manage Gender Privacy
echo 4.] [%sprstat%] Manage Relationship Status Privacy
echo.
echo 5.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto privacy
if "%choice%"=="1" goto pname
if "%choice%"=="2" goto pbdate
if "%choice%"=="3" goto pgender
if "%choice%"=="4" goto prstat
if "%choice%"=="5" goto accsettings
goto privacy







rem NAME PRIVACY SCREEN
:pname
cls
title %user% ^> Home ^> Settings ^> Privacy ^> Manage Name Privacy
set choice=false
echo Who can see your name on your profile?
echo.
echo 1.] Public
echo 2.] Private
echo.
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto pname
if "%choice%"=="1" set done=true&set spname=Public&echo if "%%userchoice%%"=="%user%" set psname=true>>userchoice.bat
if "%choice%"=="2" set done=true&set spname=Private&echo if "%%userchoice%%"=="%user%" set psname=false>>userchoice.bat
if "%choice%"=="1" set done=true&set spname=Public&echo if "%%userchoice%%"=="%user%" set psname=true>>userchoice2.bat
if "%choice%"=="2" set done=true&set spname=Private&echo if "%%userchoice%%"=="%user%" set psname=false>>userchoice2.bat
if "%choice%"=="3" goto privacy
if %done%==true echo set spname=%spname%>>%user%privacy.bat
if %done%==true set/p pause=Name Privacy Has Been Changed Successfully&goto privacy
goto pname









rem BIRTHDATE PRIVACY SCREEN
:pbdate
cls
title %user% ^> Home ^> Settings ^> Privacy ^> Manage Birthdate Privacy
set choice=false
echo Who can see your birthdate on your profile?
echo.
echo 1.] Public
echo 2.] Private
echo.
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto pbdate
if "%choice%"=="1" set done=true&set spbdate=Public&echo if "%%userchoice%%"=="%user%" set psbdate=true>>userchoice.bat
if "%choice%"=="2" set done=true&set spbdate=Private&echo if "%%userchoice%%"=="%user%" set psbdate=false>>userchoice.bat
if "%choice%"=="1" set done=true&set spbdate=Public&echo if "%%userchoice%%"=="%user%" set psbdate=true>>userchoice2.bat
if "%choice%"=="2" set done=true&set spbdate=Private&echo if "%%userchoice%%"=="%user%" set psbdate=false>>userchoice2.bat
if "%choice%"=="3" goto privacy
if %done%==true echo set spbdate=%spbdate%>>%user%privacy.bat

if %done%==true set/p pause=Birthdate Privacy Has Been Changed Successfully&goto privacy
goto pbdate









rem GENDER PRIVACY SCREEN
:pgender
cls
title %user% ^> Home ^> Settings ^> Privacy ^> Manage Gender Privacy
set choice=false
echo Who can see your gender on your profile?
echo.
echo 1.] Public
echo 2.] Private
echo.
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto pgender
if "%choice%"=="1" set done=true&set spgender=Public&echo if "%%userchoice%%"=="%user%" set psgender=true>>userchoice.bat
if "%choice%"=="2" set done=true&set spgender=Private&echo if "%%userchoice%%"=="%user%" set psgender=false>>userchoice.bat
if "%choice%"=="1" set done=true&set spgender=Public&echo if "%%userchoice%%"=="%user%" set psgender=true>>userchoice2.bat
if "%choice%"=="2" set done=true&set spgender=Private&echo if "%%userchoice%%"=="%user%" set psgender=false>>userchoice2.bat
if "%choice%"=="3" goto privacy
if %done%==true echo set spgender=%spgender%>>%user%privacy.bat
if %done%==true set/p pause=Gender Privacy Has Been Changed Successfully&goto privacy
goto pgender






rem RELATIONSHIP STATUS PRIVACY SCREEN
:prstat
cls
title %user% ^> Home ^> Settings ^> Privacy ^> Manage Relationship Status Privacy
set choice=false
echo Who can see your Relationship Status on your profile?
echo.
echo 1.] Public
echo 2.] Private
echo.
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto prstat
if "%choice%"=="1" set done=true&set sprstat=Public&echo if "%%userchoice%%"=="%user%" set psrs=true>>userchoice.bat
if "%choice%"=="2" set done=true&set sprstat=Private&echo if "%%userchoice%%"=="%user%" set psrs=false>>userchoice.bat
if "%choice%"=="1" set done=true&set sprstat=Public&echo if "%%userchoice%%"=="%user%" set psrs=true>>userchoice2.bat
if "%choice%"=="2" set done=true&set sprstat=Private&echo if "%%userchoice%%"=="%user%" set psrs=false>>userchoice2.bat
if "%choice%"=="3" goto privacy
if %done%==true echo set sprstat=%sprstat%>>%user%privacy.bat
if %done%==true set/p pause=Relationship Status Privacy Has Been Changed Successfully&goto privacy
goto prstat








rem PROFILE SCREEN
:profile
cls
set choice=false
title %user% ^> Home ^> Profile
echo Profile
echo.
echo 1.] View My Profile
echo 2.] View Someone's Profile
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto profile
if "%choice%"=="1" goto profile1
if "%choice%"=="2" goto profile2
if "%choice%"=="3" goto menu
if "%choice%"=="%choice%" goto profile






rem SELF'S PROFILE
:profile1
cls
set choice=false
title %user% ^> Home ^> Profile ^> %user%
echo %user%'s Profile
echo.
echo Username: %user%
if "%mname%"=="false" echo Name: %fname% %lname%
if not "%mname%"=="false" echo Name: %fname% %mname% %lname%
echo Gender: %gender%
echo Birthdate: %bmonth% %bday%, %byear%
echo Relationship Status: %rstat%
echo.
echo 1.] Edit Profile
echo 2.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto profile1
if "%choice%"=="1" goto editprofile
if "%choice%"=="2" goto profile
goto profile1




rem EDIT PROFILE SCREEN
:editprofile
cls
set choice=false
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile
echo Edit Profile
echo.
echo 1.] Edit Name
echo 2.] Edit Gender
echo 3.] Edit Birthdate
echo 4.] Edit Relationship Status
echo 5.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto editprofile
if "%choice%"=="1" goto editname
if "%choice%"=="2" goto editgender
if "%choice%"=="3" goto editbdate
if "%choice%"=="4" goto editrs
if "%choice%"=="5" goto profile1
goto editprofile






rem EDIT NAME SCREEN
:editname
cls
set choice=false
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Name
echo Edit Name
echo.
if "%mname%"=="false" echo Current Name: %fname% %lname%
if not "%mname%"=="false" echo Current Name: %fname% %mname% %lname%
echo.
echo 1.] Change First Name
if not "%mname%"=="false" echo 2.] Change Middle Name
if "%mname%"=="false" echo 2.] Add Middle Name
echo 3.] Change Last Name
echo 4.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto editname
if "%choice%"=="1" goto cfs
if "%choice%"=="2" goto cms
if "%choice%"=="3" goto cls
if "%choice%"=="4" goto editprofile
goto editname





rem CHANGE FIRST NAME SCREEN
:cfs
cls
set check=10
set cfname=false
set choice=false
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Name ^> Change First Name
echo Change First Name
echo.
echo Current First Name: %fname%
:cfs2
set cfname=false
set/p cfname=New First Name:
if "%cfname%"=="false" goto editname
set check=false
set pos=0
set number=false
:numcheck
echo set character=%%cfname:~%pos%,1%%>>var.bat
call var.bat
del var.bat
set/a check="10"+"%character%"+"0"
if not %check%==10 set number=true
set/a pos=%pos%+1
if defined character goto numcheck
if %number%==true echo Please Enter Your New First Name Using Letters Only.& goto cfs2
echo if "%%user%%%%pass%%"=="%user%%pass%" set fname=%cfname%>>accs.bat
echo if %%userchoice%%==%user% set sfname=%cfname%>>userchoice2.bat
set fname=%cfname%
set/p pause=Your First Name Has Been Changed Successfully.&goto editname




rem ADD OR CHANGE MIDDLE NAME SCREEN
:cms
cls
set check=10
set cmname=false
set choice=false
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Name ^> Change Middle Name
if not "%mname%"=="false" echo Change Middle Name
if "%mname%"=="false" echo Add Middle Name
echo.
if not "%mname%"=="false" echo Current Middle Name: %mname%
:cms2
set cmname=false
set/p cmname=New Middle Name:
if "%cmname%"=="false" goto editname
set check=false
set pos=0
set number=false
:numcheck4
echo set character=%%cmname:~%pos%,1%%>>var.bat
call var.bat
del var.bat
set/a check="10"+"%character%"+"0"
if not %check%==10 set number=true
set/a pos=%pos%+1
if defined character goto numcheck4
if %number%==true echo Please Enter Your New Middle Name Using Letters Only.& goto cms2
echo if "%%user%%%%pass%%"=="%user%%pass%" set mname=%cmname%>>accs.bat
echo if %%userchoice%%==%user% set smname=%cmname%>>userchoice2.bat
set mname=%cmname%
set/p pause=Your Middle Name Has Been Changed Successfully.&goto editname





rem CHANGE LAST NAME SCREEN
:cls
cls
set check=10
set clname=false
set choice=false
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Name ^> Change Last Name
echo Change Last Name
echo.
echo Current Last Name: %lname%
:cls2
set clname=false
set/p clname=New Last Name:
if "%clname%"=="false" goto editname
set check=false
set pos=0
set number=false
:numcheck5
echo set character=%%clname:~%pos%,1%%>>var.bat
call var.bat
del var.bat
set/a check="10"+"%character%"+"0"
if not %check%==10 set number=true
set/a pos=%pos%+1
if defined character goto numcheck5
if %number%==true echo Please Enter Your New Last Name Using Letters Only.& goto cls2
echo if "%%user%%%%pass%%"=="%user%%pass%" set lname=%clname%>>accs.bat
echo if %%userchoice%%==%user% set slname=%clname%>>userchoice2.bat
set lname=%clname%
set/p pause=Your Last Name Has Been Changed Successfully.&goto editname








rem EDIT GENDER SCREEN
:editgender
cls
set done=false
set cgender=false
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Gender
echo Edit Gender
echo.
echo Current Gender: %gender%
echo 1.] Male
echo 2.] Female
:cgender
set cgender=false
set/p cgender=New Gender:
if "%cgender%"=="1" set cgender=Male&set done=true
if "%cgender%"=="2" set cgender=Female&set done=true
if "%cgender%"=="false" goto editprofile
if "%done%"=="false" echo Please type a valid answer.& goto cgender
echo if "%%user%%%%pass%%"=="%user%%pass%" set gender=%cgender%>>accs.bat
echo if %%userchoice%%==%user% set sgender=%cgender%>>userchoice2.bat
set gender=%cgender%
set/p pause=Your Gender has been Changed Successfully.&goto editprofile







rem EDIT BIRTHDATE SCREEN
:editbdate
set choice=false
cls
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Birthdate
echo Edit Birthdate
echo.
echo Current Birthdate: %bmonth% %bday%, %byear%
echo.
echo 1.] Edit Birth Month
echo 2.] Edit Birth Day
echo 3.] Edit Birth Year
echo 4.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto editbdate
if "%choice%"=="1" goto ebm
if "%choice%"=="2" goto ebd
if "%choice%"=="3" goto eby
if "%choice%"=="4" goto editprofile
if "%choice%"=="%choice%" goto editbdate




rem EDIT BIRTH MONTH SCREEN
:ebm
set cbmonth=false
cls
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Birth Month
echo Edit Birth Month
echo.
echo Current Birth Month: %bmonth%
echo.
echo 1.] January
echo 2.] February
echo 3.] March
echo 4.] April
echo 5.] May
echo 6.] June
echo 7.] July
echo 8.] August
echo 9.] September
echo 10.] October
echo 11.] November
echo 12.] December
:cbmonth
set done=false
set cbmonth=false
set/p cbmonth=Birthmonth:
if "%cbmonth%"=="1" set cbmonth=January&set done=true
if "%cbmonth%"=="2" set cbmonth=February&set done=true
if "%cbmonth%"=="3" set cbmonth=March&set done=true
if "%cbmonth%"=="4" set cbmonth=April&set done=true
if "%cbmonth%"=="5" set cbmonth=May&set done=true
if "%cbmonth%"=="6" set cbmonth=June&set done=true
if "%cbmonth%"=="7" set cbmonth=July&set done=true
if "%cbmonth%"=="8" set cbmonth=August&set done=true
if "%cbmonth%"=="9" set cbmonth=September&set done=true
if "%cbmonth%"=="10" set cbmonth=October&set done=true
if "%cbmonth%"=="11" set cbmonth=November&set done=true
if "%cbmonth%"=="12" set cbmonth=December&set done=true
if "%done%"=="false" echo Please type your birthmonth.&goto cbmonth
echo if "%%user%%%%pass%%"=="%user%%pass%" set bmonth=%cbmonth%>>accs.bat
echo if %%userchoice%%==%user% set sbmonth=%cbmonth%>>userchoice2.bat
set bmonth=%cbmonth%
set/p pause=Your Birth Month has been Changed Successfully.&goto editbdate






rem EDIT BIRTH DAY SCREEN
:ebd
set cbday=false
set check=10
cls
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Birth Day
echo Edit Birth Day
echo.
echo Current Birth Day: %bday%
:cbday
set check=10
set cbday=false
set/p cbday=Birthday(dd):
if "%cbday%"=="false" goto editbdate
set/a check="10"+"%cbday%"
if %check%==10 echo Please type a valid birthday.&goto cbday
if %cbday% lss 0 echo Please type a valid birthday.&goto cbday
if %cbday% gtr 32 echo Please type a valid birthday.&goto cbday
echo if "%%user%%%%pass%%"=="%user%%pass%" set bday=%cbday%>>accs.bat
echo if %%userchoice%%==%user% set sbday=%cbday%>>userchoice2.bat
set bday=%cbday%
set/p pause=Your Birth Day has been Changed Successfully.&goto editbdate





rem edit BIRTH YEAR SCREEN
:eby
set cbyear=false
cls
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Birth Year
echo Edit Birth Year
echo.
echo Current Birth Year: %byear%
:cbyear
set cbyear=false
set check=10
set/p cbyear=Birthyear(yyyy):
set/a check="10"+"%cbyear%"
if %check%==10 echo Please type a valid birthyear.&goto byear
if %cbyear% lss 1910 echo Please type a valid birthyear.&goto cbyear
if %cbyear% gtr 2018 echo Please type a valid birthyear.&goto cbyear
echo if "%%user%%%%pass%%"=="%user%%pass%" set byear=%cbyear%>>accs.bat
echo if %%userchoice%%==%user% set sbyear=%cbyear%>>userchoice2.bat
set byear=%cbyear%
set/p pause=Your Birth Year has been Changed Successfully.&goto editbdate






rem EDIT RELATIONSHIP STATUS SCREEN
:editrs
set crstat=false
cls
title %user% ^> Home ^> Profile ^> %user% ^> Edit Profile ^> Edit Relationship Status
echo Edit Relationship Status
echo.
echo Current Relationship Status: %rstat%
set done=false
echo.
echo 1.] Single
echo 2.] In a Relationship
echo 3.] Engaged
echo 4.] Married
echo 5.] In a Civil Union
echo 6.] In a Domestic Partnership
echo 7.] In an Open Relationship
echo 8.] It's Complicated
echo 9.] Seperated
echo 10.] Divorced
:crstat
set crstat=false
set/p crstat=Relationship Status:
if "%crstat%"=="1" set crstat=Single&set done=true
if "%crstat%"=="2" set crstat=In a Relationship&set done=true
if "%crstat%"=="3" set crstat=Engaged&set done=true
if "%crstat%"=="4" set crstat=Married&set done=true
if "%crstat%"=="5" set crstat=In a Civil Union&set done=true
if "%crstat%"=="6" set crstat=In a Domestic Partnership&set done=true
if "%crstat%"=="7" set crstat=In an Open Relationship&set done=true
if "%crstat%"=="8" set crstat=It's Complicated&set done=true
if "%crstat%"=="9" set crstat=Seperated&set done=true
if "%crstat%"=="10" set crstat=Divorced&set done=true
if "%crstat%"=="false" goto profile1
if "%done%"=="false" echo Please type a valid answer.&goto crstat
echo if "%%user%%%%pass%%"=="%user%%pass%" set rstat=%crstat%>>accs.bat
echo if %%userchoice%%==%user% set srstat=%crstat%>>userchoice2.bat
set rstat=%crstat%
set/p pause=Your Relationship Status has been Changed Successfully.&goto editprofile









rem VIEW SOMEONE'S PROFILE SCREEN
:profile2
set blockedby=false
set blocked=false
set done=false
set choice=false
set userchoice=false
set sfname=false
set smname=false
set slname=false
set sgender=false
set sbmonth=false
set sbday=false
set sbyear=false
set srstat=false
set psname=false
set psgender=false
set pbdate=false
set psrs=false
set stalk=false
set/a back=%usercount%+1
cls
title %user% ^> Home ^> Profile ^> 
echo View Someone's Profile
echo.
echo Username List:
echo.
call %user%blockby.bat
call userlist.bat
echo %back%.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto profile2
call userchoice.bat
:stalk
call userchoice2.bat
if "%userchoice%"=="%user%" goto profile1
if "%choice%"=="%back%" goto profile
if %done%==false goto profile2
:sprofile
cls
set choice=false
call blocklist.bat
if %blocked%==true goto profile2
if %blockedby%==true goto profile2
title %user% ^> Home ^> Profile ^> %userchoice%
echo %userchoice%'s Profile
echo.
echo Username: %userchoice%
if %psname%==false if %psgender%==false if %psbdate%==false if %psrs%==false echo.
if %psname%==false if %psgender%==false if %psbdate%==false if %psrs%==false echo This Account is Private.
if %psname%==true if "%smname%"=="false" echo Name: %sfname% %slname%
if %psname%==true if not "%smname%"=="false" echo Name: %sfname% %smname% %slname%
if %psgender%==true echo Gender: %sgender%
if %psbdate%==true echo Birthdate: %sbmonth% %sbday%, %sbyear%
if %psrs%==true echo Relationship Status: %srstat%
echo.
echo 1.] Block %userchoice%
echo 2.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto sprofile
if "%choice%"=="1" call :blockfunction
if "%choice%"=="2" if "%stalk%"=="true" goto inboxsettings
if "%choice%"=="2" goto profile2
if "%choice%"=="%choice%" goto sprofile












rem INBOX SCREEN
:inbox
cls
color 07
set usernn=%user%
set userchoicenn=none
set done=false
set choice=false
set convo=0
call %user%inboxcount.bat
set/a option1=%convo%+1
set/a back=%convo%+2
title %user% ^> Home ^> Inbox
echo Inbox
echo.
call %user%inbox.bat
if %convo%==0 echo You don't have any messages yet.
echo %option1%.] New Message
echo %back%.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto inbox
call %user%inboxchoice.bat
if "%choice%"=="%option1%" goto inbox1
if "%choice%"=="%back%" goto menu
if "%done%"=="false" goto inbox









rem CONVERSATION SCREEN
:inbox2
set blocked=false
set message=false
set userchoice=%inboxchoice%
set swear=false
set symbol=false
set blockedby=false
call %user%%inboxchoice%settings.bat
color %cc1%%cc2%
cls
title %user% ^> Home ^> Inbox ^> %inboxchoice%
call %user%%inboxchoice%.bat
call blocklist.bat
if %blocked%==true set/p pause=You blocked %inboxchoice%'s account. You can unblock them in settings.& goto inbox
if %blockedby%==true set/p pause=%inboxchoice% isn't available right now.& goto inbox
echo.
echo [1.) Back]
echo [2.) Settings]
set/p message=Message:
call :symbolmessagefunction
if %symbol%==true set/p pause=Error! Please don't use any of the following characters: ^> ^< ^= ^^ ^"&goto inbox2
if "%message%"=="2" goto inboxsettings
if "%message%"=="false" goto inbox2
if "%message%"=="1" goto inbox
set var=%message%
call :lengthfunction
if %pos% gtr 150 set/p pause=Error! Message size limit reached.&goto inbox2
call :swearfunction
if %swear%==true set/p pause=Error! Please don't use foul words.&goto inbox2
call :usershortfunction
call :userchoiceshortfunction
echo echo [%usershort%]%%userchoicenn%%: %message%>>%userchoice%%user%.bat
echo echo [%usershort%]%%usernn%%: %message%>>%user%%userchoice%.bat
goto inbox2










rem INBOX SETTINGS SCREEN
:inboxsettings
set choice=false
title %user% ^> Home ^> Inbox ^> %inboxchoice% ^> Chat Settings
cls
echo Chat Settings
echo.
echo 1.] View %userchoice%'s Profile
echo 2.] Change Chat Color
echo 3.] Nicknames
echo 5.] Delete Conversation
echo 6.] Block %userchoice%
echo 7.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto inboxsettings
if "%choice%"=="1" set stalk=true&goto stalk
if "%choice%"=="2" goto inboxcolor
if "%choice%"=="3" goto inboxnn
if "%choice%"=="5" goto delinbox
if "%choice%"=="6" call :blockfunction&goto inbox2
if "%choice%"=="7" goto inbox2
goto inboxsettings






rem DELETE CONVERSATION SCREEN
:delinbox
set choice=false
cls
echo Delete this entire conversation?
echo.
echo Once you delete your copy of the
echo conversation, it can't be undone.
echo.
echo 1.] Delete
echo 2.] Cancel
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto delinbox
if "%choice%"=="1" goto delinbox1
if "%choice%"=="2" goto inboxsettings
goto delinbox





:delinbox1
del %user%%inboxchoice%.bat
call :usershortfunction
call :userchoiceshortfunction
echo echo [%userchoiceshort%]%%userchoicenn%%>>%user%%userchoice%.bat
echo echo.>>%user%%userchoice%.bat
goto inbox2






rem INBOX NICKNAMES SCREEN
:inboxnn
call %user%%userchoice%settings.bat
set choice=false
cls
echo Nicknames
echo.
echo 1.] [%usernn%]  Edit Your Nickname
echo 2.] [%userchoicenn%]  Edit %userchoice%'s Nickname
echo.
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto inboxsettings
if "%choice%"=="1" goto usernn
if "%choice%"=="2" goto userchoicenn
if "%choice%"=="3" goto inboxsettings
goto inboxnn








rem EDIT SOMEONE'S NICKNAME
:userchoicenn
call %user%%userchoice%settings.bat
set choice=false
cls
echo Edit %userchoice%'s Nickname
echo.
echo Current Nickname: %userchoicenn%
set/p choice=New Nickname[Leave Blank to Cancel]:
call :symbolchoicefunction
if %symbol%==true goto inboxsettings
if "%choice%"=="false" goto inboxnn
echo set userchoicenn=%choice%>>%user%%userchoice%settings.bat
echo set usernn=%choice%>>%userchoice%%user%settings.bat
set userchoicenn=%choice%
goto inboxnn






rem EDIT YOUR NICKNAME SCREEN
:usernn
call %user%%userchoice%settings.bat
set choice=false
cls
echo Edit Your Nickname
echo.
echo Current Nickname: %usernn%
set/p choice=New Nickname[Leave Blank to Cancel]:
call :symbolchoicefunction
if %symbol%==true goto inboxsettings
if "%choice%"=="false" goto inboxnn
echo set usernn=%choice%>>%user%%userchoice%settings.bat
echo set userchoicenn=%choice%>>%userchoice%%user%settings.bat
set usernn=%choice%
goto inboxnn













rem CHANGE CHAT COLOR SCREEN
:inboxcolor
call %user%%userchoice%settings.bat
call :convocolorfunction
set choice=false
cls
echo Change Chat Color With %userchoice%
echo.
echo 1.] [%tcc%] Change Text Color
echo 2.] [%bcc%] Change Background Color
echo.
echo 3.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto inboxcolor
if "%choice%"=="1" goto tcc
if "%choice%"=="2" goto bcc
if "%choice%"=="3" goto inboxsettings
goto inboxcolor




rem CHANGE TEXT COLOR SCREEN
:tcc
set pcc2=%cc2%
set choice=false
call %user%%inboxchoice%settings.bat
call :convocolorfunction
color %cc1%%cc2%
cls
echo Change Text Color
echo.
echo  1.] Black
echo  2.] Blue
echo  3.] Green
echo  4.] Aqua
echo  5.] Red
echo  6.] Purple
echo  7.] Yellow
echo  8.] White
echo  9.] Gray
echo 10.] Light Blue
echo 11.] Light Green
echo 12.] Light Aqua
echo 13.] Light Red
echo 14.] Light Purple
echo 15.] Light Yellow
echo 16.] Bright White
echo.
echo 0.] Back
echo.
echo Current Color: %tcc%
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto tcc
if "%choice%"=="0" goto inboxcolor
if "%choice%"=="1" set cc2=0&echo set cc2=^0>>%user%%userchoice%settings.bat
if "%choice%"=="1" set cc2=0&echo set cc2=^0>>%userchoice%%user%settings.bat
if "%choice%"=="2" set cc2=1&echo set cc2=^1>>%user%%userchoice%settings.bat
if "%choice%"=="2" set cc2=1&echo set cc2=^1>>%userchoice%%user%settings.bat
if "%choice%"=="3" set cc2=2&echo set cc2=^2>>%user%%userchoice%settings.bat
if "%choice%"=="3" set cc2=2&echo set cc2=^2>>%userchoice%%user%settings.bat
if "%choice%"=="4" set cc2=3&echo set cc2=^3>>%user%%userchoice%settings.bat
if "%choice%"=="4" set cc2=3&echo set cc2=^3>>%userchoice%%user%settings.bat
if "%choice%"=="5" set cc2=4&echo set cc2=^4>>%user%%userchoice%settings.bat
if "%choice%"=="5" set cc2=4&echo set cc2=^4>>%userchoice%%user%settings.bat
if "%choice%"=="6" set cc2=5&echo set cc2=^5>>%user%%userchoice%settings.bat
if "%choice%"=="6" set cc2=5&echo set cc2=^5>>%userchoice%%user%settings.bat
if "%choice%"=="7" set cc2=6&echo set cc2=^6>>%user%%userchoice%settings.bat
if "%choice%"=="7" set cc2=6&echo set cc2=^6>>%userchoice%%user%settings.bat
if "%choice%"=="8" set cc2=7&echo set cc2=^7>>%user%%userchoice%settings.bat
if "%choice%"=="8" set cc2=7&echo set cc2=^7>>%userchoice%%user%settings.bat
if "%choice%"=="9" set cc2=8&echo set cc2=^8>>%user%%userchoice%settings.bat
if "%choice%"=="9" set cc2=8&echo set cc2=^8>>%userchoice%%user%settings.bat
if "%choice%"=="10" set cc2=9&echo set cc2=^9>>%user%%userchoice%settings.bat
if "%choice%"=="10" set cc2=9&echo set cc2=^9>>%userchoice%%user%settings.bat
if "%choice%"=="11" set cc2=a&echo set cc2=a>>%user%%userchoice%settings.bat
if "%choice%"=="11" set cc2=a&echo set cc2=a>>%userchoice%%user%settings.bat
if "%choice%"=="12" set cc2=b&echo set cc2=b>>%user%%userchoice%settings.bat
if "%choice%"=="12" set cc2=b&echo set cc2=b>>%userchoice%%user%settings.bat
if "%choice%"=="13" set cc2=c&echo set cc2=c>>%user%%userchoice%settings.bat
if "%choice%"=="13" set cc2=c&echo set cc2=c>>%userchoice%%user%settings.bat
if "%choice%"=="14" set cc2=d&echo set cc2=d>>%user%%userchoice%settings.bat
if "%choice%"=="14" set cc2=d&echo set cc2=d>>%userchoice%%user%settings.bat
if "%choice%"=="15" set cc2=e&echo set cc2=e>>%user%%userchoice%settings.bat
if "%choice%"=="15" set cc2=e&echo set cc2=e>>%userchoice%%user%settings.bat
if "%choice%"=="16" set cc2=f&echo set cc2=c>>%user%%userchoice%settings.bat
if "%choice%"=="16" set cc2=f&echo set cc2=c>>%userchoice%%user%settings.bat
if %cc2%==%cc1% set/p pause=The text color cannot be the same as the background color.&set cc2=%pcc2%&echo set cc2=^%pcc2%>>%user%%userchoice%settings.bat
if %cc2%==%cc1% echo set cc2=^%pcc2%>>%userchoice%%user%settings.bat
goto tcc









rem CHANGE BACKGROUND COLOR SCREEN
:bcc
set pcc1=%cc1%
set choice=false
call %user%%inboxchoice%settings.bat
call :convocolorfunction
color %cc1%%cc2%
cls
echo Change Background Color
echo.
echo  1.] Black
echo  2.] Blue
echo  3.] Green
echo  4.] Aqua
echo  5.] Red
echo  6.] Purple
echo  7.] Yellow
echo  8.] White
echo  9.] Gray
echo 10.] Light Blue
echo 11.] Light Green
echo 12.] Light Aqua
echo 13.] Light Red
echo 14.] Light Purple
echo 15.] Light Yellow
echo 16.] Bright White
echo.
echo 0.] Back
echo.
echo Current Color: %bcc%
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto bcc
if "%choice%"=="0" goto inboxcolor
if "%choice%"=="1" set cc1=0&echo set cc1=^0>>%user%%userchoice%settings.bat
if "%choice%"=="1" set cc1=0&echo set cc1=^0>>%userchoice%%user%settings.bat
if "%choice%"=="2" set cc1=1&echo set cc1=^1>>%user%%userchoice%settings.bat
if "%choice%"=="2" set cc1=1&echo set cc1=^1>>%userchoice%%user%settings.bat
if "%choice%"=="3" set cc1=2&echo set cc1=^2>>%user%%userchoice%settings.bat
if "%choice%"=="3" set cc1=2&echo set cc1=^2>>%userchoice%%user%settings.bat
if "%choice%"=="4" set cc1=3&echo set cc1=^3>>%user%%userchoice%settings.bat
if "%choice%"=="4" set cc1=3&echo set cc1=^3>>%userchoice%%user%settings.bat
if "%choice%"=="5" set cc1=4&echo set cc1=^4>>%user%%userchoice%settings.bat
if "%choice%"=="5" set cc1=4&echo set cc1=^4>>%userchoice%%user%settings.bat
if "%choice%"=="6" set cc1=5&echo set cc1=^5>>%user%%userchoice%settings.bat
if "%choice%"=="6" set cc1=5&echo set cc1=^5>>%userchoice%%user%settings.bat
if "%choice%"=="7" set cc1=6&echo set cc1=^6>>%user%%userchoice%settings.bat
if "%choice%"=="7" set cc1=6&echo set cc1=^6>>%userchoice%%user%settings.bat
if "%choice%"=="8" set cc1=7&echo set cc1=^7>>%user%%userchoice%settings.bat
if "%choice%"=="8" set cc1=7&echo set cc1=^7>>%userchoice%%user%settings.bat
if "%choice%"=="9" set cc1=8&echo set cc1=^8>>%user%%userchoice%settings.bat
if "%choice%"=="9" set cc1=8&echo set cc1=^8>>%userchoice%%user%settings.bat
if "%choice%"=="10" set cc1=9&echo set cc1=^9>>%user%%userchoice%settings.bat
if "%choice%"=="10" set cc1=9&echo set cc1=^9>>%userchoice%%user%settings.bat
if "%choice%"=="11" set cc1=a&echo set cc1=a>>%user%%userchoice%settings.bat
if "%choice%"=="11" set cc1=a&echo set cc1=a>>%userchoice%%user%settings.bat
if "%choice%"=="12" set cc1=b&echo set cc1=b>>%user%%userchoice%settings.bat
if "%choice%"=="12" set cc1=b&echo set cc1=b>>%userchoice%%user%settings.bat
if "%choice%"=="13" set cc1=c&echo set cc1=c>>%user%%userchoice%settings.bat
if "%choice%"=="13" set cc1=c&echo set cc1=c>>%userchoice%%user%settings.bat
if "%choice%"=="14" set cc1=d&echo set cc1=d>>%user%%userchoice%settings.bat
if "%choice%"=="14" set cc1=d&echo set cc1=d>>%userchoice%%user%settings.bat
if "%choice%"=="15" set cc1=e&echo set cc1=e>>%user%%userchoice%settings.bat
if "%choice%"=="15" set cc1=e&echo set cc1=e>>%userchoice%%user%settings.bat
if "%choice%"=="16" set cc1=f&echo set cc1=c>>%user%%userchoice%settings.bat
if "%choice%"=="16" set cc1=f&echo set cc1=c>>%userchoice%%user%settings.bat
if %cc1%==%cc2% set/p pause=The background color cannot be the same as the text color.&set cc1=%pcc1%&echo set cc1=^%pcc1%>>%user%%userchoice%settings.bat
if %cc1%==%cc2% echo set cc1=^%pcc1%>>%userchoice%%user%settings.bat
goto bcc










rem NEW MESSAGE SCREEN
:inbox1
set exist=false
set userchoice=false
set blocked=false
set blockedby=false
set done=false
set message=false
set/a back=%usercount%+1
title %user% ^> Home ^> Inbox ^> New Message
cls
set choice=false
echo New Message
echo.
echo To:
echo.
call %user%blockby.bat
call userlist.bat
echo %back%.] Back
set/p choice=^>
call :symbolchoicefunction
if %symbol%==true goto inbox1
call userchoice.bat
call blocklist.bat
if "%choice%"=="%back%" goto inbox
if %blocked%==true goto inbox1
if %blockedby%==true goto inbox1
if "%userchoice%"=="%user%" set/p pause=You can't message yourself.& goto inbox1
if "%done%"=="false" goto inbox1
call %user%inboxchoice.bat
if %exist%==true goto inbox2
cls
title %user% ^> Home ^> Inbox ^> New Message ^> %userchoice%
echo New Message
echo.
set/p message=Message to %userchoice%:
if "%message%"=="false" goto inbox
call :usershortfunction
call :userchoiceshortfunction
echo echo [%usershort%]%%userchoicenn%%>>%userchoice%%user%.bat
echo echo.>>%userchoice%%user%.bat
echo echo [%usershort%]%%userchoicenn%%: %message%>>%userchoice%%user%.bat
echo echo [%userchoiceshort%]%%userchoicenn%%>>%user%%userchoice%.bat
echo echo.>>%user%%userchoice%.bat
echo echo [%usershort%]%%usernn%%: %message%>>%user%%userchoice%.bat
echo set/a convo=%%convo%%+1>>%user%inboxcount.bat
set/a convo=%convo%+1
echo echo %convo%.] %userchoice%>>%user%inbox.bat
echo if "%%choice%%"=="%convo%" set inboxchoice=%userchoice%^&set done=true>>%user%inboxchoice.bat
set sconvo=%convo%
call %userchoice%inboxcount.bat
echo set/a convo=%%convo%%+1>>%userchoice%inboxcount.bat
set/a convo=%convo%+1
echo echo %convo%.] %user%>>%userchoice%inbox.bat
echo if "%%choice%%"=="%convo%" set inboxchoice=%user%^&set done=true>>%userchoice%inboxchoice.bat
echo if "%%userchoice%%"=="%userchoice%" set exist=true^&set inboxchoice=%userchoice%>>%user%inboxchoice.bat
echo if "%%userchoice%%"=="%user%" set exist=true^&set inboxchoice=%user%>>%userchoice%inboxchoice.bat
echo set cc1=0^&set cc2=f^&set usernn=%user%^&set userchoicenn=%userchoice%>>%user%%userchoice%settings.bat
echo set cc1=0^&set cc2=f^&set usernn=%userchoice%^&set userchoicenn=%user%>>%userchoice%%user%settings.bat
set convo=%sconvo%
set inboxchoice=%userchoice%
goto inbox2


















rem -------------------FUNCTIONS---------------------
:blockfunction
set choice=false
set done=false
set pastblock=false
call %user%blockcount.bat
cls
echo Block %userchoice%?
echo.
echo.
echo %userchoice% will no longer be able to:
echo.
echo - See your posts on your timeline
echo - Message you
echo.
echo 1.] Confirm
echo 2.] Cancel
set/p choice=^>
call %user%pastblock.bat
if %pastblock%==true goto pastblock
if "%choice%"=="2" exit /b
if "%choice%"=="1" set done=true
if "%done%"=="false" goto blockfunction
echo set/a blocklist=%%blocklist%%+1>>%user%blockcount.bat
set/a blocklist=%blocklist%+1
echo if "%%block%userchoice%%%"=="true" echo %blocklist%.] %userchoice%>>%user%blocklist.bat
echo if "%%userchoice%%"=="%userchoice%" set pastblock=true^&set blocklist=^%blocklist%>>%user%pastblock.bat
:pastblock
call %user%blockcount.bat
echo if "%%choice%%"=="%blocklist%" set approved=true^& set userchoice=%userchoice%>>%user%blockchoice.bat
echo if "%%user%%%%pass%%"=="%user%%pass%" set block%userchoice%=true>>accs.bat
echo if "%%user%%"=="%userchoice%" if "%%userchoice%%"=="%user%" set blockedby=true>>blocklist.bat
echo if "%%user%%"=="%user%" if "%%userchoice%%"=="%userchoice%" set blocked=true>>blocklist.bat
echo set blockedby%user%==true>>%userchoice%blockby.bat
set block%userchoice%=true
set blocked=true
exit /b

:lengthfunction
set pos=0
:lfstart
echo set character=%%var:~%pos%,1%%>>length.bat
call length.bat
del length.bat
if not defined character exit /b
set/a pos=%pos%+1
if %pos% gtr 150 exit /b
goto lfstart

:swearfunction
set pos=0
set smess=0
:cfstart
set done=false
echo set character=%%var:~%pos%,1%%>>swear.bat
call swear.bat
del swear.bat
if not defined character goto cf2
if "%character%"=="A" set character=a
if "%character%"=="B" set character=b
if "%character%"=="C" set character=c
if "%character%"=="D" set character=d
if "%character%"=="E" set character=e
if "%character%"=="F" set character=f
if "%character%"=="G" set character=g
if "%character%"=="H" set character=h
if "%character%"=="I" set character=i
if "%character%"=="J" set character=j
if "%character%"=="K" set character=k
if "%character%"=="L" set character=l
if "%character%"=="M" set character=m
if "%character%"=="N" set character=n
if "%character%"=="O" set character=o
if "%character%"=="P" set character=p
if "%character%"=="Q" set character=q
if "%character%"=="R" set character=r
if "%character%"=="S" set character=s
if "%character%"=="T" set character=t
if "%character%"=="U" set character=u
if "%character%"=="V" set character=v
if "%character%"=="W" set character=w
if "%character%"=="X" set character=x
if "%character%"=="Y" set character=y
if "%character%"=="Z" set character=z
if "%character%"==" " set done=true
if "%character%"=="*" set done=true
if "%character%"=="2" set done=true
if "%character%"=="3" set done=true
if "%character%"=="4" set done=true
if "%character%"=="5" set done=true
if "%character%"=="6" set done=true
if "%character%"=="7" set done=true
if "%character%"=="8" set done=true
if "%character%"=="9" set done=true
if "%character%"=="0" set done=true
if "%character%"=="." set done=true
if "%character%"=="?" set done=true
if "%character%"=="!" set done=true
if "%character%"=="," set done=true
if "%character%"=="," set done=true
if "%character%"=="," set done=true
if "%character%"==":" set done=true
if "%character%"==";" set done=true
if "%character%"=="%pastchar%" set done=true
if "%pastchar%"=="o" if "%character%"=="%pastchar%" set done=false
if "%pastchar%"=="s" if "%character%"=="%pastchar%" set done=false
if "%pastchar%"=="l" if "%character%"=="%pastchar%" set done=false
if "%pastchar%"=="b" if "%character%"=="%pastchar%" set done=false
if "%pastchar%"=="v" if "%character%"=="%pastchar%" set done=false
set/a pos=%pos%+1
if %done%==true goto cf1
set pastchar=%character%
set smess=%smess%%character%
:cf1
goto cfstart
:cf2
set done=false
set pos=0
set smess=%smess:~1%
:cf2start
echo set filter=%%smess:~%pos%,3%%>>censor.bat
call censor.bat
del censor.bat

rem THREE LETTERS SWEAR WORDS
if not defined filter goto cf3
if %filter%==ass set done=true
if %filter%==hell set done=true
if %filter%==cum set done=true
if %filter%==fag set done=true
if %filter%==gay set done=true
if %filter%==tit set done=true
if %filter%==fap set done=true
if %filter%==fuk set done=true
if %filter%==cok set done=true
if %filter%==dik set done=true
if %filter%==sht set done=true
if %filter%==cnt set done=true
if %filter%==fak set done=true
if %filter%==kkk set done=true
if %filter%==lsd set done=true
if %filter%==ira set done=true
if %filter%==cpd set done=true
if %filter%==pak set done=true
if %filter%==fck set done=true
if %filter%==fak set done=true
if %filter%==dck set done=true
if %filter%==dic set done=true
if %filter%==fup set done=true
if %filter%==fop set done=true
if %filter%==foc set done=true
if %filter%==fok set done=true
if %filter%==fuc set done=true
if %filter%==shi set done=true
if %filter%==vag set done=true
if %filter%==pta set done=true
if %filter%==bbo set done=true
if %filter%==vvo set done=true
if %filter%==tae set done=true
if %filter%==tng set done=true
if %filter%==nmo set done=true



if %done%==true set swear=true&exit /b
set/a pos=%pos%+1
goto cf2start
:cf3
set done=false
set pos=0
:cf3start
echo set filter=%%smess:~%pos%,4%%>>censor.bat
call censor.bat
del censor.bat

rem FOUR LETTER SWEAR WORDS
if not defined filter exit /b
if %filter%==fuck set done=true
if %filter%==cunt set done=true
if %filter%==shit set done=true
if %filter%==btch set done=true
if %filter%==fick set done=true
if %filter%==fock set done=true
if %filter%==feck set done=true
if %filter%==foak set done=true
if %filter%==jism set done=true
if %filter%==gism set done=true
if %filter%==jizz set done=true
if %filter%==slut set done=true
if %filter%==slat set done=true
if %filter%==twat set done=true
if %filter%==tits set done=true
if %filter%==damn set done=true
if %filter%==piss set done=true
if %filter%==cock set done=true
if %filter%==puss set done=true
if %filter%==wank set done=true
if %filter%==fuuk set done=true
if %filter%==faak set done=true
if %filter%==fook set done=true
if %filter%==sh1t set done=true
if %filter%==dick set done=true
if %filter%==arse set done=true
if %filter%==darn set done=true
if %filter%==shet set done=true
if %filter%==gook set done=true
if %filter%==homo set done=true
if %filter%==jerk set done=true
if %filter%==anus set done=true
if %filter%==dumb set done=true
if %filter%==bobo set done=true
if %filter%==tnga set done=true
if %filter%==puta set done=true
if %filter%==pota set done=true
if %filter%==dyke set done=true
if %filter%==jugs set done=true
if %filter%==kike set done=true
if %filter%==scum set done=true
if %filter%==shag set done=true
if %filter%==slag set done=true
if %filter%==spic set done=true
if %filter%==suck set done=true
if %filter%==turd set done=true
if %filter%==vovo set done=true
if %filter%==vuvu set done=true
if %filter%==vuvo set done=true
if %filter%==vovu set done=true
if %filter%==vvvv set done=true
if %filter%==bbbb set done=true
if %filter%==bovo set done=true
if %filter%==vobo set done=true
if %filter%==vubo set done=true
if %filter%==vobu set done=true
if %filter%==bovu set done=true
if %filter%==buvo set done=true
if %filter%==buvu set done=true
if %filter%==bubu set done=true
if %filter%==bubo set done=true
if %filter%==bubu set done=true
if %filter%==bobu set done=true
if %filter%==pots set done=true
if %filter%==poop set done=true
if %filter%==tang set done=true
if %filter%==namo set done=true
if %filter%==namu set done=true
if %filter%==bwct set done=true
if %filter%==bwis set done=true


if %done%==true set swear=true&exit /b
set/a pos=%pos%+1
goto cf3start


:symbolmessagefunction
set symbol=false
set pos=0
:sfstart
echo set character=^^%%message:~%pos%,1%%>>symbol.bat
call symbol.bat
del symbol.bat
if not defined character exit /b
set/a pos=%pos%+1
if ^%character%==^> set symbol=true
if ^%character%==^< set symbol=true
if ^%character%==^^ set symbol=true
if ^%character%==^= set symbol=true
if ^%character%==^" set symbol=true
goto sfstart

:symbolchoicefunction
set symbol=false
set pos=0
:sfstart1
echo set character=^^%%choice:~%pos%,1%%>>symbol.bat
call symbol.bat
del symbol.bat
if not defined character exit /b
set/a pos=%pos%+1
if ^%character%==^> set symbol=true
if ^%character%==^< set symbol=true
if ^%character%==^^ set symbol=true
if ^%character%==^= set symbol=true
if ^%character%==^" set symbol=true
goto sfstart1

:symbolpassfunction
set symbol=false
set pos=0
:sfstart2
echo set character=^^%%pass:~%pos%,1%%>>symbol.bat
call symbol.bat
del symbol.bat
if not defined character exit /b
set/a pos=%pos%+1
if ^%character%==^> set symbol=true
if ^%character%==^< set symbol=true
if ^%character%==^^ set symbol=true
if ^%character%==^= set symbol=true
if ^%character%==^" set symbol=true
goto sfstart2

:symboluserfunction
set symbol=false
set pos=0
:sfstart3
echo set character=^^%%pass:~%pos%,1%%>>symbol.bat
call symbol.bat
del symbol.bat
if not defined character exit /b
set/a pos=%pos%+1
if ^%character%==^> set symbol=true
if ^%character%==^< set symbol=true
if ^%character%==^^ set symbol=true
if ^%character%==^= set symbol=true
if ^%character%==^" set symbol=true
goto sfstart3

:convocolorfunction
if %cc1%==0 set bcc=Black
if %cc1%==1 set bcc=Blue
if %cc1%==2 set bcc=Green
if %cc1%==3 set bcc=Aqua
if %cc1%==4 set bcc=Red
if %cc1%==5 set bcc=Purple
if %cc1%==6 set bcc=Yellow
if %cc1%==7 set bcc=White
if %cc1%==8 set bcc=Gray
if %cc1%==9 set bcc=Light Blue
if %cc1%==A set bcc=Light Green
if %cc1%==B set bcc=Light Aqua
if %cc1%==C set bcc=Light Red
if %cc1%==D set bcc=Light Purple
if %cc1%==E set bcc=Light Yellow
if %cc1%==F set bcc=Bright White
if %cc1%==a set bcc=Light Green
if %cc1%==b set bcc=Light Aqua
if %cc1%==c set bcc=Light Red
if %cc1%==d set bcc=Light Purple
if %cc1%==e set bcc=Light Yellow
if %cc1%==f set bcc=Bright White
if %cc2%==0 set tcc=Black
if %cc2%==1 set tcc=Blue
if %cc2%==2 set tcc=Green
if %cc2%==3 set tcc=Aqua
if %cc2%==4 set tcc=Red
if %cc2%==5 set tcc=Purple
if %cc2%==6 set tcc=Yellow
if %cc2%==7 set tcc=White
if %cc2%==8 set tcc=Gray
if %cc2%==9 set tcc=Light Blue
if %cc2%==A set tcc=Light Green
if %cc2%==B set tcc=Light Aqua
if %cc2%==C set tcc=Light Red
if %cc2%==D set tcc=Light Purple
if %cc2%==E set tcc=Light Yellow
if %cc2%==F set tcc=Bright White
if %cc2%==a set tcc=Light Green
if %cc2%==b set tcc=Light Aqua
if %cc2%==c set tcc=Light Red
if %cc2%==d set tcc=Light Purple
if %cc2%==e set tcc=Light Yellow
if %cc2%==f set tcc=Bright White
exit /b


:usershortfunction
set short=%user%
set pos=0
set smess=0
:uscstart
echo set character=%%short:~%pos%,1%%>>usc.bat
call usc.bat
del usc.bat
if not defined character goto usc2
set/a pos=%pos%+1
if %character%==a set character=A
if %character%==b set character=B
if %character%==c set character=C
if %character%==d set character=D
if %character%==e set character=E
if %character%==f set character=F
if %character%==g set character=G
if %character%==h set character=H
if %character%==i set character=I
if %character%==j set character=J
if %character%==k set character=K
if %character%==l set character=L
if %character%==m set character=M
if %character%==n set character=N
if %character%==o set character=O
if %character%==p set character=P
if %character%==q set character=Q
if %character%==r set character=R
if %character%==s set character=S
if %character%==t set character=T
if %character%==u set character=U
if %character%==v set character=V
if %character%==w set character=W
if %character%==x set character=X
if %character%==y set character=Y
if %character%==z set character=Z
set smess=%smess%%character%
goto uscstart
:usc2
set usershort=%smess:~1,3%
exit /b

:userchoiceshortfunction
set short=%userchoice%
set pos=0
set smess=0
:usccstart
echo set character=%%short:~%pos%,1%%>>uscc.bat
call uscc.bat
del uscc.bat
if not defined character goto uscc2
set/a pos=%pos%+1
if %character%==a set character=A
if %character%==b set character=B
if %character%==c set character=C
if %character%==d set character=D
if %character%==e set character=E
if %character%==f set character=F
if %character%==g set character=G
if %character%==h set character=H
if %character%==i set character=I
if %character%==j set character=J
if %character%==k set character=K
if %character%==l set character=L
if %character%==m set character=M
if %character%==n set character=N
if %character%==o set character=O
if %character%==p set character=P
if %character%==q set character=Q
if %character%==r set character=R
if %character%==s set character=S
if %character%==t set character=T
if %character%==u set character=U
if %character%==v set character=V
if %character%==w set character=W
if %character%==x set character=X
if %character%==y set character=Y
if %character%==z set character=Z
set smess=%smess%%character%
goto usccstart
:uscc2
set userchoiceshort=%smess:~1,3%
exit /b

TO DO:

Inbox Settings
Account Settings
Newsfeed
Notification                                                                                                                                                                                                                                                                                                                                       