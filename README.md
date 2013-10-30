# Android Cucumber Testing

Was asked to get Cucumber & Calabash behavior driven testing harness setup for an Android App

## Installation of Android Elements
```
First download and setup your SDK: http://developer.android.com/sdk/index.html
```
```
Next have $ANDROID_HOME set to the path of your /sdk/ folder
```
```
Finally Ensure you have an Android Virtual Device called Nexus4: http://developer.android.com/tools/devices/managing-avds-cmdline.html
```
## Installation of Ruby Elements
```
First Install Ruby 2.0.0: https://www.ruby-lang.org/en/downloads/
```
```
Next Install RubyGems: http://guides.rubygems.org/
```
```
Finally Install Bundler: http://bundler.io/
```
```
Now you are ready to setup the framework, run the 'bundle' command in the root directory of this repository in order to install the calabash gem and you are ready to test.
```
## Usage

### Linux Users
```
Make sure you have 'screen' installed before continuing, then run the ./test.sh script to see all of your options

$ test.sh [options] test|start|stop|run|install
```
#### Test
```
$ ./test.sh test [name & location of apk]

This command will run the full Cucumber/Calabash test from starting the Emulator to finishing the tests and shutting the emulator down.
```
```
$ ./test.sh start

This command starts the emulator and automatically removes the lockscreen while giving the app gps coordinates. Process usually takes around 60 seconds.
```
```
$ ./test.sh stop

This command stops the emulator and shuts down any testing no matter what state it's in. 
```
```
$ ./test.sh run [name & location of apk]

This command just runs the Cucumber tests, it's expected that the emulator has already been started and is simply waiting for tests to be ran. Great for debugging tests.
```
```
$ ./test.sh install

This command runs the bundle command and any other installation commands necessary for running the tests for the firs time on a machine.
```
### Windows Users
```
To start the emulator simply run the following:

$ANDROID_HOME/tools/emulator -avd Nexus4

Wait 55 seconds and then run the following:

$ANDROID_HOME/platform-tools/adb shell input keyevent 82

Finally make sure to run the following in the root of the repository:

telnet localhost 5554 < telnet.commands
```
```
To start the tests after emulator is up and running in the root of the respository:

calabash-android run PatrolApp-debug.apk
```