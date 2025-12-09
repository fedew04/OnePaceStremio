cd C:\Users\fedew2\Documents\OnePaceStremio\stream\series
@echo off

:: --- CONFIGURATION ---
set arc=SY
set total_episodes=7
set hash=f6c32b46bb55924888aed6815bfa0edb7287a45e
:: ---------------------

FOR /L %%i IN (1, 1, %total_episodes%) DO (
    CALL :setText %arc% %%i %hash%
)

echo Generation complete.
EXIT /B %ERRORLEVEL%

:setText
set filename=%~1_%~2.json
set /a fileid=%~2-1

echo Creating file: %filename% (FileIdx: %fileid%)

echo { > %filename%
echo "streams": [ >> %filename%
echo         { >> %filename%
echo             "infoHash": "%~3", >> %filename%
echo             "fileIdx": %fileid% >> %filename%
echo         } >> %filename%
echo    ] >> %filename%
echo } >> %filename%

EXIT /B 0