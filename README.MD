# The Codename Lungo Build Script
This script automatically strips, optimizes, added things that Codename Lungo ROMS are know for..

## Installation Instructions  

#### 1. Install the prerequisites ####
~~~
sudo apt-get install curl git-core 
~~~

#### 2. Pull the repo ####

go to the bin folder in your home folder 
~~~
cd ~/bin
~~~

pull the repo
~~~
git pull git@bitbucket.org:codenamelungo/build.git cnl-build
~~~


#### 3. Add cnl-build to your path ####
edit .bash_profile
~~~
sudo nano ~/.bash_profile
~~~

add the following to the top of the file 
~~~
export PATH=~/bin:~/bin/cnl-build:$PATH
~~~

#### 4. How to use? ####
1. download the CM or OmniROM nightly in you download folder 
2. unzip the nightly with the archive manager in seperate folder 
3. open your Terminal and go to the extracted nightly
4. type cnlbuild and follow the steps.