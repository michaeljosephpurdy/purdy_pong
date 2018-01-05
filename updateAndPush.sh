zip -9 -r /tmp/game.love .
adb push /tmp/game.love /sdcard/game.love
adb shell am start -S -n "org.love2d.android/.GameActivity" -d "file:///sdcard/game.love"

