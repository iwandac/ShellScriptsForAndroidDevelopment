@echo off
@rem ------------Define folders here--------------
set folder=vendor
set tmpFolder=old
set folderSets=lib lib64
@rem ---------------------------------------------
if not exist %tmpFolder% md %tmpFolder%
for %%h in (%folderSets%) do (
    if not exist %tmpFolder%\%%h md %tmpFolder%\%%h
)
adb root && adb remount && adb disable-verity
pause
for %%i in (%folderSets%) do (
    for %%j in (%%i/*) do (
        adb pull %folder%/%%i/%%j %tmpFolder%\%%i
        if exist %tmpFolder%\%%i\%%j (
            adb push %%i\%%j /%folder%/%%i
            echo -----Please check and ensure each of a group has a SAME sha256 hash value!!!------
            adb shell sha256sum %folder%/%%i/%%j
            certutil -hashfile %%i\%%j SHA256
            echo ----------------------------------------------------------------------------------
        ) else (
            echo %folder%/%%i/%%j failed to be pulled, skip pushing this file.
        )
    )
)
pause
