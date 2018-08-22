@echo off

FOR /F "tokens=* USEBACKQ" %%F IN (`docker ps -q`) DO (
    docker stop %%F
)