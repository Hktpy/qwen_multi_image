@echo off
set CONDA_ENV_NAME=qwen-edit

call conda info --base >nul 2>nul
if %errorlevel% neq 0 (
    echo Conda is not installed or not in the system's PATH.
    echo Please install Miniconda and try again.
    pause
    exit /b
)

conda env list | findstr /c:"%CONDA_ENV_NAME%" >nul
if %errorlevel% neq 0 (
    echo Creating Conda environment %CONDA_ENV_NAME%...
    conda create -n %CONDA_ENV_NAME% python=3.10 -y
)

call conda activate %CONDA_ENV_NAME%

echo Installing dependencies...
pip install -r Qwen-Image-Edit-Angles\requirements.txt

echo Starting the application...
python Qwen-Image-Edit-Angles\app.py

pause
