@echo off
SET NAME=SingleCore Worldserver
TITLE %NAME%
set mainfolder=%CD%
set characters=ashamane_characters

echo Clearing ahbot's auctions from database...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\clear_auction.sql"

"%mainfolder%\Server\Bin\worldserver.exe"