#! /bin/bash

# General Settings
currentdir=$(pwd) 		# Get Current Working Dir 
now=$(date +'%Y%m%d') # Get Date
cmversion=$(echo "cm11") # CM11
paversion=$(echo "pa4.4") # PA 
getapex='curl -s -o ApexLauncher.apk apex.anddoes.com/Download.aspx' # Download Latest ApexLauncher
getromstats='curl -s -o RomStats.apk build.codenamelungo.net/RomStats.apk' # Download Latest RomStats
getmedia='curl -s -o media.zip build.codenamelungo.net/media.zip' # Download Latest Media

# Build Cyanogenmod 11
function build_CM11 (){
	echo ""
	echo "What device are you building?"
	echo -n "enter device name: "
	read -e DEVICE
	echo ""
	echo "Build Information"
	echo "-----------------------------"
	echo "Device:	$DEVICE"
	echo "Android: $cmversion"
	echo "Build Date: $now"
	echo "-----------------------------"
	echo ""
	read -p "Everything ok? press [enter] to continue"
	echo ""
	echo "Starting Build!"
	echo ""
	sleep 2
	cd $currentdir/system/app
	echo "Cleaning Apps..."
	rm -fv Apollo.apk BasicDreams.apk Browser.apk Calculator.apk CMFileManager.apk CMHome.apk CMWallpapers.apk DocumentsUI.apk DownloadProviderUi.apk DSPManager.apk Email.apk Exchange2.apk Galaxy4.apk HoloSpiralWallpaper.apk HTMLViewer.apk LiveWallpapers.apk LiveWallpapersPicker.apk LockClock.apk MagicSmokeWallpapers.apk NoiseField.apk PacProcessor.apk PhaseBeam.apk PhotoTable.apk SoundRecorder.apk Stk.apk Term.apk Torch.apk VideoEditor.apk VisualizationWallpapers.apk
	cd $currentdir/system/priv-app
	rm -fv BackupRestoreConfirmation.apk CMAccount.apk CMUpdater.apk InputDevices.apk PicoTts.apk Trebuchet.apk VoiceDialer.apk
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
	cd $currentdir/system/app/
	$getromstats
	echo "Adding RomStats..."
	echo "ROMStats Added!"
	sleep 2
  echo ""
  echo "Setting chmod rights"
  cd $currentdir/system/priv-app
  chmod +x ApexLauncher.apk
  cd $currentdir/system/app 
  chmod +x RomStats.apk
  echo "Setting chmod rights Done!"
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
	mate $currentdir/system/build.prop
	read -p "Build.prop is open press [enter] when you are done"
	echo ""
	cd $currentdir
	find . -name '.DS_Store' -type f -delete
	find . -name '*.DS_Store' -type f -delete
	7z a CodenameLungo-$cmversion-$now-$DEVICE.zip
	mv CodenameLungo-$cmversion-$now-$DEVICE.zip ~/Downloads
	echo "Build is done!"
}

# Build Paranoid Android
function build_pa (){
	echo ""
	echo "What device are you building?"
	echo -n "enter device name: "
	read -e DEVICE
	echo ""
	echo "Build Information"
	echo "-----------------------------"
	echo "Device:	$DEVICE"
	echo "Android: $paversion"
	echo "Build Date: $now"
	echo "-----------------------------"
	echo ""
	read -p "Everything ok? press [enter] to continue"
	echo ""
	echo "Starting Build!"
	echo ""
	sleep 2
	cd $currentdir/system/app
	echo "Cleaning Apps..."
	rm -fv BasicDreams.apk Browser.apk Calculator.apk DocumentsUI.apk DownloadProviderUi.apk Email.apk Exchange2.apk Galaxy4.apk HoloSpiralWallpaper.apk HTMLViewer.apk Launcher3.apk Lightbulb.apk LiveWallpapers.apk LiveWallpapersPicker.apk MagicSmokeWallpapers.apk NoiseField.apk OmniTorch.apk OpenWnn.apk PacProcessor.apk PhaseBeam.apk PhotoTable.apk SoundRecorder.apk Stk.apk VideoEditor.apk VisualizationWallpapers.apk
	cd $currentdir/system/priv-app
	rm -fv InputDevices.apk MusicFX.apk ParanoidOTA.apk
	echo "App Cleaning DONE!"
	sleep 2
	echo ""
	echo "Cleaning Libs..."
	cd $currentdir/system/lib
	rm -f *videoeditor*
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
	echo "Downloading Latest RomStats..."
	cd $currentdir/system/app/
	$getromstats
	echo "Adding RomStats..."
	echo "ROMStats Added!"
	sleep 2
  echo ""
  echo "Setting chmod rights"
  cd $currentdir/system/app 
  chmod +x ApexLauncher.apk
  chmod +x RomStats.apk
  echo "Setting chmod rights Done!"
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
	mate $currentdir/system/build.prop
	read -p "Build.prop is open press [enter] when you are done"
	echo ""
	cd $currentdir
	find . -name '.DS_Store' -type f -delete
	find . -name '*.DS_Store' -type f -delete
	7z a CodenameLungo-$paversion-$now-$DEVICE.zip
	mv CodenameLungo-$paversion-$now-$DEVICE.zip ~/Downloads
	echo "Build is done!"
}


show_header (){
	echo ""
	echo "Codename Lungo Build Script "
	echo "---------------------------------------------------------"
	echo "Version     	: 20140618"
	echo "Maintainer  	: T.Veluwenkamp <contact@timveluwenkamp.eu>"
	echo "Copyright   	: Copyright (C) 2014 T.Veluwenkamp"
	echo "---------------------------------------------------------"
	echo ""
}

show_menu() {
	echo "Select Android Version"
	echo "----------------------"
	echo "1. Cyanogenmod 11"
	echo "2. Paranoid Android"
	echo "3. Exit"
}

function read_input(){
	local c
	read -p "Enter build target [ 1 - 3 ] " c
	case $c in
		1)	build_CM11 ;;
		2)	build_pa ;;
		3)	echo "Good Bye!"; exit 0; ;;
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