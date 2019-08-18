@echo off
SET NAME=SingleCore Database
TITLE %NAME%
set mainfolder=%CD%

:world_db
if exist ADB_world_820.00.sql goto apache
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Database.7z
cls
goto apache

:apache
if exist "%mainfolder%\Server\Apache24\apache_start.bat" goto database
cd "%mainfolder%\Server"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Apache24.7z
cls
goto database

:database
if exist "%mainfolder%\Server\Database\start.bat" goto nodejs
cd "%mainfolder%\Server"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Database.7z
cls
goto nodejs

:nodejs
if exist "%mainfolder%\Server\NodeJS\node.exe" goto php
cd "%mainfolder%\Server"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf NodeJS.7z
cls
goto php

:php
if exist "%mainfolder%\Server\php5\php.exe" goto spphub
cd "%mainfolder%\Server"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf php5.7z
cls
goto spphub

:spphub
if exist "%mainfolder%\Server\SPP_Hub\spp_hub.bat" goto database_server
cd "%mainfolder%\Server"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf SPP_Hub.7z
cls
goto database_server

:database_server
cd "%mainfolder%"
"%mainfolder%\Server\Database\bin\mysqld" --defaults-file="Server\Database\SPP-Database.ini" --console --standalone --explicit_defaults_for_timestamp --sql-mode=""
exit