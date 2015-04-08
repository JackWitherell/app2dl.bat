@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`dir application.windows64`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
@echo on
for /f "tokens=1 delims=/: " %%a in ("%var6%") do set plch=%%a
set plch=%plch:01=jan%
set plch=%plch:02=feb%
set plch=%plch:03=mar%
set plch=%plch:04=apr%
set plch=%plch:05=may%
set plch=%plch:06=jun%
set plch=%plch:07=jul%
set plch=%plch:08=aug%
set plch=%plch:09=sep%
set plch=%plch:10=oct%
set plch=%plch:11=nov%
set plch=%plch:12=dec%
set myvar=%plch%
for /f "tokens=2 delims=/: " %%a in ("%var6%") do set plch=%%a
set plch=%plch:01=1%
set plch=%plch:02=2%
set plch=%plch:03=3%
set plch=%plch:04=4%
set plch=%plch:05=5%
set plch=%plch:06=6%
set plch=%plch:07=7%
set plch=%plch:08=8%
set plch=%plch:09=9%
set myvar=%myvar%%plch%.
for /f "tokens=3 delims=/: " %%a in ("%var6%") do set myvar=%myvar%%%a_
for /f "tokens=4 delims=/: " %%a in ("%var6%") do set plch=%%a
set plch=%plch:01=1%
set plch=%plch:02=2%
set plch=%plch:03=3%
set plch=%plch:04=4%
set plch=%plch:05=5%
set plch=%plch:06=6%
set plch=%plch:07=7%
set plch=%plch:08=8%
set plch=%plch:09=9%
set myvar=%myvar%%plch%.
for /f "tokens=5 delims=/: " %%a in ("%var6%") do set myvar=%myvar%%%a
for /f "tokens=6 delims=/: " %%a in ("%var6%") do set plch=%%a
set plch=%plch:AM=am%
set plch=%plch:PM=pm%
set myvar=%myvar%%plch%
echo %myvar%

xcopy /E application.windows64 ..\Download\%myvar%\64\
xcopy /E application.windows32 ..\Download\%myvar%\32\
rmdir /s /q application.windows32
rmdir /s /q application.windows64