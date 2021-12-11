@echo off

setlocal
call :setESC

REM This function will perform try to perform disable/stop/remove steps
REM if sucessfull, it will prompt 'ServiceName Sucessfully Removed'
REM otherwise it will prompt 'ServiceName Already Disable' or 'Unexpected Error'

sc query state= all | findstr "%1" >NUL 2>NUL
if %ERRORLEVEL% EQU 1 ( 
	echo %ESC%[46m[ %1 Service Already Set to Delayed Automatic ]%ESC%[0m  
) else (
	sc config %1 start= delayed-auto
	if %ERRORLEVEL% EQU 0 (echo %ESC%[42m[ %1 Service Successfully Set to Delayed Automatic ]%ESC%[0m
	) else (
		echo %1: %ESC%[41m[ Unexpected Error While Trying to Set to Delayed Automatic %1 ]%ESC%[0m
	)
)


:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0

