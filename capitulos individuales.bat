cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=OR
set ep=2
set hash=9a870a7c01d716bad7330b1a14ef687a3062c955

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
