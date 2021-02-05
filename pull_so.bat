@echo off
set file_name=libgsl.so
set folder=vendor
@rem -----------------------------------------
set tmpFolder=temp
set lib32=lib
set lib64=lib64
@rem -----------------------------------------
if defined file_name (
    if not exist %tmpFolder% md %tmpFolder%
    if not exist %tmpFolder%\%lib32% md %tmpFolder%\%lib32%
    if not exist %tmpFolder%\%lib64% md %tmpFolder%\%lib64%
    adb root
    adb remount
    adb pull %folder%/%lib32%/%file_name% %tmpFolder%\%lib32%
    adb pull %folder%/%lib64%/%file_name% %tmpFolder%\%lib64%
    if exist %tmpFolder%\%lib32%\%file_name% (
        if exist %tmpFolder%\%lib64%\%file_name% (
            echo %file_name% successfully pulled!!!
            pause
            exit
        )
    )
    echo %file_name% failed to be pulled, check the temp folder.
) else (
    echo Enter a file name!
)
pause