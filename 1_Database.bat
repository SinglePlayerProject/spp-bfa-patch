@echo off
SET NAME=SingleCore Database
TITLE %NAME%
COLOR 06
set mainfolder=%CD%
cd "%mainfolder%"

:world_db_check
"%mainfolder%\Server\Tools\wget.exe" -c -N --no-check-certificate ftp://spp-forum.de/Single_Player_Project/Repack/World_of_Warcraft/BFA/ADB_820.7z
cls
goto world_db

:world_db
if exist ADB_world_820.00.sql goto apache
"%mainfolder%\Server\Tools\7za.exe" e -y -spf ADB_820.7z
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
echo.
echo Checking broken databases...
"%mainfolder%\Server\Database\bin\myisamchk" -r -v -f --sort_buffer_size=2G --key_buffer_size=2G "%mainfolder%\Server\Database\data\ashamane_auth\*.MYI"
"%mainfolder%\Server\Database\bin\myisamchk" -r -v -f --sort_buffer_size=2G --key_buffer_size=2G "%mainfolder%\Server\Database\data\ashamane_characters\*.MYI"
"%mainfolder%\Server\Database\bin\myisamchk" -r -v -f --sort_buffer_size=2G --key_buffer_size=2G "%mainfolder%\Server\Database\data\ashamane_hotfixes\*.MYI"
"%mainfolder%\Server\Database\bin\myisamchk" -r -v -f --sort_buffer_size=2G --key_buffer_size=2G "%mainfolder%\Server\Database\data\ashamane_world\*.MYI"
cls

"%mainfolder%\Server\Database\bin\mysqld" --defaults-file="Server\Database\SPP-Database.ini" --console --standalone --explicit_defaults_for_timestamp --sql-mode=""
exit