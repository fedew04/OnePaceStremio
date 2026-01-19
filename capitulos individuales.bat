cd C:\Users\fedew2\Documents\OnePaceStremio\stream\series
@echo off

set arc=GA
set ep=1
set hash=8ef4ef99b9aed84a0111114f9efd830ced8046ae

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
