@echo off

if "%~1"=="build" (
    docker-compose up --build
    echo "Builder up with build option"
) else (
    docker-compose up
    echo "Builder up"
)

