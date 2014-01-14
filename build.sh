#! /bin/bash

# General Settings
currentdir=$(pwd) 		# Get Current Working Dir 
now=$(date +'%Y%m%d') # Get Date
version43=$(echo "4.3") # Android 4.3
version44=$(echo "4.4") # Android 4.4
getapex='curl -s -o ApexLauncher.apk apex.anddoes.com/Download.aspx' # Download Latest ApexLauncher
getromstats='curl -s -o RomStats.apk build.codenamelungo.net/RomStats.apk' # Download Latest RomStats
getmedia='curl -s -o media.zip build.codenamelungo.net/media.zip' # Download Latest Media

# Build android 4.3
function build_android43 (){
	echo ""
	echo "What device are you building?"
	echo -n "enter device name: "
	read -e DEVICE
	echo ""
	echo "Build Information"
	echo "-----------------------------"
	echo "Device:	$DEVICE"
	echo "Android: $version43"
	echo "Build Date:$now"
	echo "-----------------------------"
	echo ""
	read -p "Everything ok? press [enter] to continue"
	echo ""
	echo "Starting Build!"
	echo ""
	sleep 2
	cd $currentdir/system/app
	echo "Cleaning Apps..."
	rm -f Apollo.apk ApplicationsProvider.apk BackupRestoreConfirmation.apk BasicDreams.apk Browser.apk Calculator.apk CMAccount.apk CMFileManager.apk CMUpdater.apk CMWallpapers.apk DocumentsUI.apk DownloadProviderUi.apk DSPManager.apk Email.apk	Email2.apk Exchange2.apk FmRadio.apk Galaxy4.apk HoloSpiralWallpaper.apk HTMLViewer.apk InputDevices.apk LiveWallpapers.apk LiveWallpapersPicker.apk MagicSmokeWallpapers.apk MonthCalendarWidget.apk NoiseField.apk OmniTorch.apk OpenWnn.apk PacProcessor.apk PhaseBeam.apk PhotoTable.apk PicoTts.apk QuickSearchBox.apk SharedStorageBackup.apk Shell.apk SoundRecorder.apk Stk.apk Term.apk Torch.apk Trebuchet.apk VideoEditor.apk VisualizationWallpapers.apk VoiceDialer.apk VoicePlus.apk webaudiores.apk
	echo "App Cleaning DONE!"
	sleep 2
	echo ""
	echo "Cleaning Libs..."
	cd $currentdir/system/lib
	rm -f libjackpal-androidterm4.so libttspico.so *videoeditor*
	echo "Lib Cleaning DONE!"
	echo ""
	echo "Cleaning Media..."
	rm -rf $currentdir/system/tts
	rm -rf $currentdir/system/media/video
	rm -rf $currentdir/system/media/audio/*
	rm -f $currentdir/system/media/bootanimation.zip
	echo "Media Cleaning DONE!"
	sleep 2
	echo ""
	echo "Downloading Latest ApexLauncher..."
	$getapex
	mv ApexLauncher.apk $currentdir/system/app/
	echo "Adding ApexLauncher..."
	echo "ApexLauncher Added!"
	sleep 2
	echo ""
	echo "Downloading Latest ROM Stats..."
	cd $currentdir/system/app/
	$getromstats
	echo "Adding RomStats..."
	echo "RomStats Added!"
	sleep 2
	echo ""
	echo "Downloading Latest Codename Lungo Media..."
	cd $currentdir/system/media/audio
	$getmedia
	echo "Adding Codename Lungo Media..."
	unzip -q media.zip
	rm -f media.zip
	echo "Codename Lungo Media Added!"
	sleep 2
	echo ""
	echo "Opening build.prop for Cleaning..."
	subl $currentdir/system/build.prop
	read -p "Build.prop is open press [enter] when you are done"
	echo ""
	cd $currentdir
	7z a CodenameLungo-$DEVICE$version43-$now.zip
	#md5sum CodenameLungo-$DEVICE$version43-$now.zip > CodenameLungo-$DEVICE$version43-$now.md5
	mv CodenameLungo-$DEVICE$version43-$now.zip ~/Downloads
	#mv CodenameLungo-$DEVICE$version43-$now.md5 ~/Downloads
	echo "Build is done!"
}

# Build android 4.4
function build_android44 (){
	echo ""
	echo "What device are you building?"
	echo -n "enter device name: "
	read -e DEVICE
	echo ""
	echo "Build Information"
	echo "-----------------------------"
	echo "Device:	$DEVICE"
	echo "Android: $version44"
	echo "Build Date:$now"
	echo "-----------------------------"
	echo ""
	read -p "Everything ok? press [enter] to continue"
	echo ""
	echo "Starting Build!"
	echo ""
	sleep 2
	cd $currentdir/system/app
	echo "Cleaning Apps..."
	rm -f Apollo.apk ApplicationsProvider.apk BasicDreams.apk Browser.apk Calculator.apk CMAccount.apk CMFileManager.apk CMUpdater.apk CMWallpapers.apk DocumentsUI.apk DownloadProviderUi.apk DSPManager.apk Email.apk	Email2.apk Exchange2.apk FmRadio.apk Galaxy4.apk HoloSpiralWallpaper.apk HTMLViewer.apk InputDevices.apk LiveWallpapers.apk LiveWallpapersPicker.apk MagicSmokeWallpapers.apk MonthCalendarWidget.apk NoiseField.apk OmniTorch.apk OpenWnn.apk PacProcessor.apk PhaseBeam.apk PhotoTable.apk PicoTts.apk QuickSearchBox.apk SharedStorageBackup.apk Shell.apk SoundRecorder.apk Stk.apk Term.apk Torch.apk Trebuchet.apk VideoEditor.apk VisualizationWallpapers.apk VoiceDialer.apk VoicePlus.apk webaudiores.apk
	cd $currentdir/system/priv-app
	rm -f InputDevices.apk Launcher3.apk OpenDelta.apk VoiceDialer.apk 
	echo "App Cleaning DONE!"
	sleep 2
	echo ""
	echo "Cleaning Libs..."
	cd $currentdir/system/lib
	rm -f libjackpal-androidterm4.so libttspico.so *videoeditor*
	echo "Lib Cleaning DONE!"
	echo ""
	echo "Cleaning Media..."
	rm -rf $currentdir/system/tts
	rm -rf $currentdir/system/media/video
	rm -rf $currentdir/system/media/audio/*
	rm -f $currentdir/system/media/bootanimation.zip
	echo "Media Cleaning DONE!"
	sleep 2
	echo ""
	echo "Downloading Latest ApexLauncher..."
	$getapex
	mv ApexLauncher.apk $currentdir/system/priv-app/
	echo "Adding ApexLauncher..."
	echo "ApexLauncher Added!"
	sleep 2
	echo ""
	echo "Downloading Latest RomStats..."
	cd $currentdir/system/priv-app/
	$getromstats
	echo "Adding ApexLauncher..."
	echo "ROM Stats Added!"
	sleep 2
	echo ""
	echo "Downloading Latest Codename Lungo Media..."
	cd $currentdir/system/media/audio
	$getmedia
	echo "Adding Codename Lungo Media..."
	unzip -q media.zip
	rm -f media.zip
	echo "Codename Lungo Media Added!"
	sleep 2
	echo ""
	echo "Opening build.prop for Cleaning..."
	subl $currentdir/system/build.prop
	read -p "Build.prop is open press [enter] when you are done"
	echo ""
	cd $currentdir
	7z a CodenameLungo-$DEVICE$version44-$now.zip
	#md5sum CodenameLungo-$DEVICE$version44-$now.zip > CodenameLungo-$DEVICE$version44-$now.md5
	mv CodenameLungo-$DEVICE$version44-$now.zip ~/Downloads
	#mv CodenameLungo-$DEVICE$version43-$now.md5 ~/Downloads
	echo "Build is done!"
}

show_header (){
	echo ""
	echo "Codename Lungo Build Script "
	echo "---------------------------------------------------------"
	echo "Version     	: 20140105-2"
	echo "Maintainer  	: T.Veluwenkamp <contact@timveluwenkamp.eu>"
	echo "Copyright   	: Copyright (C) 2014 T.Veluwenkamp"
	echo "---------------------------------------------------------"
	echo ""
}

show_menu() {
	echo "Select Android Version"
	echo "----------------------"
	echo "1. Android 4.4"
	echo "2. Android 4.3"
	echo "3. Exit"
}

function read_input(){
	local c
	read -p "Enter build target [ 1 - 3 ] " c
	case $c in
		1)	build_android44 ;;
		2)	build_android43 ;;
		3)	echo "Good Bye!"; exit 0 ;;
		*)	
			echo "Please select between 1 to 3 choice only."
			pause
	esac
}

# main logic
while true
do
	show_header # display header
 	show_menu	# display memu
 	read_input  # wait for user input
done