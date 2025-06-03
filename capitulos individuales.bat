cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=WA
set ep=3
set hash=7d694013793318e42338ea04e42d233e90bb5cac

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
