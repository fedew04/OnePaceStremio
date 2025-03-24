cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=EH
set ep=9
set hash=d62537c7d70f3a8b9d20ec11b593c138bb9b25d1

rem skypiea: SK
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
