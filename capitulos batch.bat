cd C:\Users\fedew\stremio-onepace\OnePaceStremio\stream\series
@echo off

set arc=RO
set episode=4
set hash=cdab4a928dbbff643bbe5531f216eb36a60c85af

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
