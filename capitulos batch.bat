cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=REV
set episode=3
set hash=4d9497e964d820760adf11e47664df3091b808f2

CALL :setText %arc% %episode% %hash% 

EXIT /B %ERRORLEVEL%
:setText
set filename=%~1_%~2.json
set /a fileid=%~2-1

echo { > %filename%
echo "streams": [ >> %filename%
echo         { >> %filename%
echo             "infoHash": "%~3", >> %filename%
echo             "fileIdx": %fileid% >> %filename%
echo         } >> %filename%
echo    ] >> %filename%
echo } >> %filename%

EXIT /B 0
