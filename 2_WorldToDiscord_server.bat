@echo off
SET NAME=SingleCore WorldToDiscord
TITLE %NAME%
set mainfolder=%CD%

:worldtodiscord
cd "%mainfolder%\Server\SPP_Hub"
start "" spp_hub.bat