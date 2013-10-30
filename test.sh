#!/bin/bash

if [ $# -eq 0 ]
then
	echo "test.sh [options] test|start|stop|run|install"
elif [ $1 == 'install' ]; then
        bundle
elif [ $1 == 'test' ]; then
        echo "Starting up the Android Emulator..."
        screen -dmS insert $ANDROID_HOME/tools/emulator -avd Nexus4
        sleep 80
        $ANDROID_HOME/platform-tools/adb shell input keyevent 82
        telnet localhost 5554 < telnet.commands
        echo "Running Calabash Test..."
        calabash-android run $2
        echo "Stopping the Android Emulator..."
        killall screen
        echo "Done."
elif [ $1 == 'start' ]; then
        echo "Starting up the Android Emulator..."
        screen -dmS insert $ANDROID_HOME/tools/emulator -avd Nexus4
        sleep 55
        $ANDROID_HOME/platform-tools/adb shell input keyevent 82
        telnet localhost 5554 < telnet.commands
        echo "Done."
elif [ $1 == 'stop' ]; then
        echo "Stopping the Android Emulator..."
        killall screen
        echo "Done."
elif [ $1 == 'run' ]; then
        echo "Running Calabash Test..."
        calabash-android run $2
        echo "Done."
fi