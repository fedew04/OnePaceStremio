cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=RO
set ep=3
set hash=4bf8bd21656e89bd9a2e9f5a81f3d6b140cd9785

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
