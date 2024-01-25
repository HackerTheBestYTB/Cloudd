@echo off
setlocal enabledelayedexpansion

set "batch_folder=%~dp0"
set "file_name=example.txt"

set "file_path=!batch_folder!!file_name!"

(for /f "usebackq delims=" %%l in ("!file_path!") do (
    set "line=%%l"
    set "line=!line:True=False!"
    echo !line!
)) > temp_file.txt

move /y temp_file.txt "!file_path!"

echo Done.
pause
