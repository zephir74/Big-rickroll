@echo off
cls

setlocal enabledelayedexpansion

set "subnet=192.168.1" :: replace 192.168.1 by ur subnet

set "targets="

for /L %%i in (1,1,255) do (
    set "ip=%subnet%.%%i"

    ping -n 1 -w 1000 %ip% >nul
    if !errorlevel! == 0 (
        set "targets=!targets! %ip%"
    )
)

for /f "tokens=*" %%A in (%targets%) do (
    net use \\%%A\path\to\rickroll.bat /user:username password
)

timeout 213
for /f "tokens=*" %%A in (%targets%) do (
    net use \\%%A\path\to /delete
)
