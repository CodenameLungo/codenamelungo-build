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

make build.sh executable
~~~
chmod +x ~/bin/cnl-build/build.sh
~~~ 

#### 3. make build command ####
edit .bash_aliases
~~~
sudo nano ~/~/.bash_aliases
~~~

add the following alias
~~~
alias cnlbuild='/home/[user]/bin/cnl-build/./build.sh'
~~~

#### 4. how to use? ####
1. download the CM or OmniROM nightly in you download folder 
2. unzip the nightly with the archive manager in seperate folder 
3. open your Terminal and go to the extracted nightly
4. type cnlbuild and follow the steps.

