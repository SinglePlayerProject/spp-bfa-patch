@echo off
SET NAME=SingleCore Webserver
TITLE %NAME%
set mainfolder=%CD%

:webserver
mkdir "%mainfolder%\Server\Apache24\logs"
cd "%mainfolder%\Server\Apache24"
start "" apache_start.bat
exit