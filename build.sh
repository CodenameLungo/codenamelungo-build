#! /bin/bash
# General Settings
currentdir=$(pwd) 		# Get Current Working Dir 
now=$(date +'%Y%m%d') # Get Date
cmversion=$(echo "CM11") # CM11
paversion=$(echo "PA4.4") # PA 
getapex='curl -s -o /tmp/cnlbuild/ApexLauncher.apk apex.anddoes.com/Download.aspx' # Download Latest ApexLauncher
getmedia='curl -s -o /tmp/cnlbuild/media.zip build.codenamelungo.net/media.zip' # Download Latest Media

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
	read -p "Check for errors press [enter] when everything is ok..."
	echo ""
  echo "Preparing Build Environment"
  mkdir -p /tmp/cnlbuild
  mkdir -p ~/Downloads/cnl-upload
  echo ""
  sleep 1
	echo "Starting Build!"
	echo ""
	sleep 1
	echo "Removing Recovery Folder..."
	rm -rf recovery
  echo "Recovery Folder Removed!"
	echo ""
	sleep 1
	cd $currentdir/system/app
	echo "Cleaning Apps..."
	rm -f Apollo.apk BasicDreams.apk Browser.apk Calculator.apk CMFileManager.apk CMHome.apk CMWallpapers.apk DocumentsUI.apk DownloadProviderUi.apk DSPManager.apk Email.apk Exchange2.apk Galaxy4.apk HoloSpiralWallpaper.apk HTMLViewer.apk LiveWallpapers.apk LiveWallpapersPicker.apk LockClock.apk MagicSmokeWallpapers.apk NoiseField.apk PacProcessor.apk PhaseBeam.apk PhotoPhase.apk PhotoTable.apk SoundRecorder.apk Stk.apk Term.apk Torch.apk VideoEditor.apk VisualizationWallpapers.apk
	cd $currentdir/system/priv-app
	rm -f BackupRestoreConfirmation.apk CMAccount.apk CMUpdater.apk InputDevices.apk PicoTts.apk Trebuchet.apk VoiceDialer.apk
	echo "App Cleaning DONE!"
	sleep 1
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
	sleep 1
	echo ""
	echo "Checking If ApexLauncher is Already Downloaded..."
  if [ -f /tmp/cnlbuild/ApexLauncher.apk ];
  then
     echo "ApexLauncher is Already Downloaded"
  else
     echo "ApexLauncher Not Present Downloading..."
     $getapex
  fi
	echo "Adding ApexLauncher..."
	cp /tmp/cnlbuild/ApexLauncher.apk $currentdir/system/app/ApexLauncher.apk
  echo "ApexLauncher Added!"
	sleep 1
  echo ""
  echo "Setting chmod rights"
  cd $currentdir/system/app 
  chmod +x ApexLauncher.apk
  chmod +x RomStats.apk
  echo "Setting chmod rights Done!"
  sleep 1
	echo ""
	echo "Downloading Latest Codename Lungo Media..."
  if [ -f /tmp/cnlbuild/media.zip ];
  then
     echo "Codename Lungo Media is Already Downloaded"
  else
     echo "Codename Lungo Media Not Present Downloading..."
     $getmedia
  fi
	echo "Adding Codename Lungo Media..."
  cp /tmp/cnlbuild/media.zip $currentdir/system/media/audio/media.zip
	cd $currentdir/system/media/audio/
  unzip -q media.zip
	rm -f media.zip
	echo "Codename Lungo Media Added!"
	sleep 1
	echo ""
	echo "Opening build.prop for Cleaning..."
	mate $currentdir/system/build.prop
	read -p "Build.prop is open press [enter] when you are done"
	echo ""
	cd $currentdir
	find . -name '.DS_Store' -type f -delete
	find . -name '*.DS_Store' -type f -delete
	7z a CodenameLungo-$cmversion-$now-$DEVICE.zip
	mv CodenameLungo-$cmversion-$now-$DEVICE.zip ~/Downloads/cnl-upload
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
	read -p "Check for errors press [enter] when everything is ok..."
	echo ""
  echo "Preparing Build Environment"
  mkdir -p /tmp/cnlbuild
  mkdir -p ~/Downloads/cnl-upload
  echo ""
  sleep 1
	echo "Starting Build!"
	echo ""
	sleep 1
	echo "Removing Recovery Folder..."
	rm -rf recovery
  echo "Recovery Folder Removed!"
	echo ""
	sleep 1
	cd $currentdir/system/app
	echo "Cleaning Apps..."
	rm -f BasicDreams.apk Browser.apk Calculator.apk DocumentsUI.apk DownloadProviderUi.apk Email.apk Exchange2.apk Galaxy4.apk HoloSpiralWallpaper.apk HTMLViewer.apk Launcher3.apk Lightbulb.apk LiveWallpapers.apk LiveWallpapersPicker.apk MagicSmokeWallpapers.apk NoiseField.apk OmniTorch.apk OpenWnn.apk PacProcessor.apk PhaseBeam.apk PhotoTable.apk SoundRecorder.apk Stk.apk VideoEditor.apk VisualizationWallpapers.apk
	cd $currentdir/system/priv-app
	rm -f InputDevices.apk MusicFX.apk ParanoidOTA.apk Launcher3.apk VoiceDialer.apk
	echo "App Cleaning DONE!"
	sleep 1
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
	sleep 1
	echo ""
	echo "Checking If ApexLauncher is Already Downloaded..."
  if [ -f /tmp/cnlbuild/ApexLauncher.apk ];
  then
     echo "ApexLauncher is Already Downloaded"
  else
     echo "ApexLauncher Not Present Downloading..."
     $getapex
  fi
	echo "Adding ApexLauncher..."
	cp /tmp/cnlbuild/ApexLauncher.apk $currentdir/system/app/ApexLauncher.apk
  echo "ApexLauncher Added!"
	sleep 1
  echo ""
  echo "Setting chmod rights"
  cd $currentdir/system/app 
  chmod +x ApexLauncher.apk
  chmod +x RomStats.apk
  echo "Setting chmod rights Done!"
  sleep 1
	echo ""
	echo "Downloading Latest Codename Lungo Media..."
  if [ -f /tmp/cnlbuild/media.zip ];
  then
     echo "Codename Lungo Media is Already Downloaded"
  else
     echo "Codename Lungo Media Not Present Downloading..."
     $getmedia
  fi
	echo "Adding Codename Lungo Media..."
  cp /tmp/cnlbuild/media.zip $currentdir/system/media/audio/media.zip
	cd $currentdir/system/media/audio/
  unzip -q media.zip
	rm -f media.zip
	echo "Codename Lungo Media Added!"
	sleep 1
	echo ""
	echo "Opening build.prop for Cleaning..."
	mate $currentdir/system/build.prop
	read -p "Build.prop is open press [enter] when you are done"
	echo ""
	cd $currentdir
	find . -name '.DS_Store' -type f -delete
	find . -name '*.DS_Store' -type f -delete
	7z a CodenameLungo-$paversion-$now-$DEVICE.zip
	mv CodenameLungo-$paversion-$now-$DEVICE.zip ~/Downloads/cnl-upload
}

show_header (){
	echo ""
	echo "Codename Lungo Build Script "
	echo "---------------------------------------------------------"
	echo "Version     	: 20141007"
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
		1)	build_CM11; exit 0; ;;
		2)	build_pa; exit 0; ;;
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
