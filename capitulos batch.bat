cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=SY
set episode=7
set hash=6c29dedaa9bef46c73a04ebe2c8c9761b92cb9eb

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
