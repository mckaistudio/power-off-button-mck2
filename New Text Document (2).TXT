@echo off
echo Power Off Button MCK: Building APK...

:: Flutter aur Git ka path set karna
set PATH=%PATH%;C:\src\flutter\bin;C:\Program Files\Git\cmd;C:\Program Files\Git\bin

echo Cleaning project...
call flutter clean

echo Fetching dependencies...
call flutter pub get

echo Building Release APK...
:: Yeh command optimized APK banaye gi
call flutter build apk --release --obfuscate --split-debug-info=./build_info --tree-shake-icons

echo.
echo Build process finished!
echo APK location: build\app\outputs\flutter-apk\app-release.apk
pause