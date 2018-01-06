zip -9 -r game.love .
adb push game.love /sdcard/game.love
adb shell am start -S -n "org.love2d.android/.GameActivity" -d "file:///sdcard/game.love"
rm game.love
