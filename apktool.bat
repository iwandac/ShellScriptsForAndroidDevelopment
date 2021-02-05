@echo off
echo.
echo ************Decrypt an APK file with apktool***********************
echo.
set /p path=Drag file to decrypt: 
"C:\Program Files\Common Files\Oracle\Java\javapath\java.exe" -jar "D:\Program Files\apktool\apktool.jar" d %path% -o %path%_Decrypted"
@Rem java -jar "D:\Program Files\apktool\apktool.jar" d %*
pause