#### 1. Add the following lines ####
before the Additional Build line. 
~~~
# ROM Statistics
ro.romstats.url=http://stats.codenamelungo.net/
ro.romstats.name=Codename Lungo Nexus 4
ro.romstats.version=PA-20140620
ro.romstats.tframe=7

# Power Saving
ro.ril.disable.collapse=1
pm.sleep_mode=1

# Other 
wifi.supplicant_scan_interval=180
~~~

#### 2. Remove the following lines ####
~~~
ro.rommanager.developerid=cyanogenmod
ro.config.ringtone=Orion.ogg
ro.config.notification_sound=Argon.ogg
ro.config.alarm_alert=Hassium.ogg
wifi.supplicant_scan_interval=15 
~~~

#### 3. Change the following lines ####
~~~
ro.cm.display.version=
ro.modversion=
~~~
