# Cheat-Engine-Proton-Helper

This Bash Script allows running Cheat Engine with Steam games running in Proton.

Based on a script from [Luetti from the Cheat Engine forums](https://www.cheatengine.org/forum/viewtopic.php?t=584042&sid=63a0518c8066bfea7b97ca3855f0640f), modified for Steam Proton games by your's truly (KingKrouch).

I put this together after some looking around for some insights on how such a thing could be done, because after switching from Windows, I needed to continue work in a way that would give me correct memory offsets for both Windows and Linux, since I work on game mods pertaining to fixing PC port related issues. The problem is that all of the Linux alternatives to Cheat Engine suck (and lack the features that I needed), and because both those and the CEServer method have completely different memory offsets that would make mod development difficult. The method of launching Cheat Engine through Steamtinkerlaunch [has been broken for a while](https://github.com/frostworx/steamtinkerlaunch/wiki/Cheat-Engine), and I needed to get a better way of doing this stuff siutuated.

## Prerequisites
* 64-Bit Wine (Instructions for [Arch Linux](https://wiki.archlinux.org/title/wine#Installation) and [Ubuntu](https://vitux.com/how-to-install-wine-on-ubuntu/) here.)

* Steam with Proton installed

* X11 (X Window System) (This is enabled for NVIDIA GPUs with propreitary drivers by default)

* xdotool installed ([See here](https://github.com/jordansissel/xdotool) for more information.)

*Note: While NVIDIA GPUs with propreitary drivers through X11 have been tested with this script, compatibility with AMD/Intel GPUs through Wayland can't be guaranteed.*

## Setup

To download the script, and set up everything you need to:
1. ```git clone https://gitlab.com/KingKrouch/cheat-engine-proton-helper.git``` in the terminal.
2. Use ```cd cheat-engine-proton-helper-git``` to enter the cloned directory
3. Use ```chmod +x ./setup.sh``` to mark the setup script as executable.
4. Run ```./setup.sh``` to automatically download and install Cheat Engine to your current Wine prefix.

*Note: If the setup script doesn't already chmod [CE.sh](CE.sh), then you can just run Step 3 of the setup process but with that file instead.*

## Configuration
1. Edit [CE.sh](CE.sh) with a text editor such as Nano, Vim, Kate, or anything else.
2. Change the ```prefixInstall``` parameter to the Steam library folder where the game is installed (By default, this is "/home/$USER/.steam/Steam").
4. Change the ```PROTONVERSIONNAME``` to the Proton version used by the game (The exact naming for the version can be found as the name of the folder in *"/home/$USER/.steam/Steam/SteamApps/Common"*), and change the ```PROTONSUBDIRECTORYNAME``` to the folder inside of said Proton directory that leads to a "bin" folder containing an executable named *"wine"* (By default, this is already set for Proton's Experimental version which uses a *"files"* directory instead of *"dist"* which is used by Proton 3.7).

*Note: More notes are provided in the file which gives more detail about certain parameters.*

## Usage
1. Simply launch [CE.sh](CE.sh) by using ```./CE.sh``` in a terminal.

*Note: Only do this after launching the game through Proton for the first time, as the speed of this setup and the directories assume that it has already gone through the initial setup phase.*

## License
Do whatever you want with it, assuming you don't remove any crediting or sell it.
