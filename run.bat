@echo off
set CONDA_ENV_NAME=qwen-edit

where conda >nul 2>nul
if %errorlevel% equ 0 (
    echo Conda detected.
    conda env list | findstr /c:"%CONDA_ENV_NAME%" >nul
    if %errorlevel% neq 0 (
        echo Creating Conda environment %CONDA_ENV_NAME%...
        conda create -n %CONDA_ENV_NAME% python=3.10 -y
    )
    call conda activate %CONDA_ENV_NAME%
) else (
    echo Conda not found. Checking for Python and pip...
    where python >nul 2>nul
    if %errorlevel% neq 0 (
        echo Python is not installed or not in the system's PATH.
        echo Please install Python and try again.
        pause
        exit /b
    )
    where pip >nul 2>nul
    if %errorlevel% neq 0 (
        echo pip is not installed or not in the system's PATH.
        echo Please install pip and try again.
        pause
        exit /b
    )
)

echo Installing dependencies...
pip install -r Qwen-Image-Edit-Angles\requirements.txt

echo Starting the application...
python Qwen-Image-Edit-Angles\app.py

pause
