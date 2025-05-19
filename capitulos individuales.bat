cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=WA
set ep=2
set hash=7a76ae41f0ec5f223d3b3851fb3a71814262d1c8

rem wano: WA
rem egghead: EH
rem arlong park: AR
rem syrup: SY
rem set filename=%arc%_%episode%.json
rem set /a fileid=episode-1
CALL :setText %arc% %ep% %hash% 


EXIT /B %ERRORLEVEL%
:setText
set filename=%~1_%~2.json

echo { > %filename%
echo "streams": [ >> %filename%
echo         { >> %filename%
echo             "infoHash": "%~3" >> %filename%
echo         } >> %filename%
echo    ] >> %filename%
echo } >> %filename%

EXIT /B 0
