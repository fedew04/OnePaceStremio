cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=EH
set ep=16
set hash=531d70c452d0baef273ede6eb93b2cf8929ba89c

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
