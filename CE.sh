 #!/bin/sh

# Cheat Engine for Proton Script:
# Based on a script from Luetti from the Cheat Engine forums, modified for Steam Proton games by KingKrouch.
#
# Requires Cheat Engine to be installed via Wine in it's default install directory.
# Feel free to tweak the stuff in the "Config" section based on the game that you are playing.
# Keep in mind that you need to have fully launched the game in the currently used Proton version once.
# Prior to running it for the first time, you need to run "chmod +x ./CE.sh" to mark this shell script as executable.
# Then, when you want to play the game with Cheat Engine, you just run "./CE.sh".

## Config: ##
##
# Here's where you should enter the Cheat Engine version that is installed, and the desired Steam AppID you want to use.
# For this example, Cheat Engine 7.2, the experimental branch of Proton, and Spacewar are being used as examples.
# Another example you can use instead of "Proton - Experimental" for the Proton Version name is "Proton 3.7", however, instead of using "files" for the Proton Subdirectory name, you would use "dist" instead.
CEVersion="7.2"
STEAMAPPID="480"
PROTONVERSIONNAME="Proton - Experimental"
PROTONSUBDIRECTORYNAME="files"

# This is where you should put the Steam library that you are running the game from, as the compatdata directory with the required Proton prefix will be there.
# For the local Steam install folder, this would be "/home/$USER/.steam/steam".
prefixInstall="/home/$USER/.steam/steam"

# These shouldn't change unless you installed Cheat Engine in a Wine prefix somewhere else.
# By default, you will either need WINE installed separately with Cheat Engine installed in it, or you will need to copy the CE program files needed to your Proton Prefix.
steamInstall="/home/$USER/.steam/"
CEPrefix="/home/$USER/.wine"

# Here's some flags you can tweak, although IIRC, ESync and FSync are required for Cheat Engine to function.
proton=$2
export WINEESYNC=1
export WINEFSYNC=1
export PROTON_FORCE_LARGE_ADDRESS_AWARE=1
export WINE_LARGE_ADDRESS_AWARE=1
TIMER_WAITTIME=5


## Script Functionality begins here: ##

# Don't mess with these variables, as they are necessary for this script to function.
TIMES_TRIED=0
LAUNCHED=0

# Sets the WinePrefix to the Proton prefix for said game.
export WINEPREFIX="$prefixInstall/steamapps/compatdata/$STEAMAPPID/pfx"

function checkProcess()
{
    sleep $TIMER_WAITTIME
    echo "Searching for Steam AppID $STEAMAPPID's window class..."
    xdotool search --class steam_app_$STEAMAPPID echo "$(($? == 0))" # Checks if the SteamApp is running inside of Proton
    if [ $? = 1 ] # If so, launches Cheat Engine.
    then
        echo "Starting Cheat Engine..."
        sleep 10 # Sleeps the rest for ten seconds to let the game have some time to launch.
        # Starts Cheat Engine using the currently used Proton prefix.
        "$steamInstall/steam/steamapps/common/$PROTONVERSIONNAME/$PROTONSUBDIRECTORYNAME/bin/wine" "$CEPrefix/drive_c/Program Files/Cheat Engine $CEVersion/cheatengine-x86_64.exe"
        $LAUNCHED == 1
    else
        TIMES_TRIED=$(( TIMES_TRIED + 1)) # Adds a try to the amount of tries that have been done.
        if [$TIMES_TRIED = 1]
        then
            echo "Tried $TIMES_TRIED times."
        else
            echo "Tried $TIMES_TRIED time."
        fi

    fi
}

function checkIfGameRunning()
{
    if (( TIMES_TRIED < 5 )) # Checks if there's less than five tries.
    then
        checkProcess # Checks the process again.
    else
        echo "ERROR # 3: Game did not launch on time. Exiting." # Gives up, as something clearly went wrong.
        sleep 3 # gives the batch script three seconds before returning the function.
        return
    fi
}


if [ -d "$WINEPREFIX" ]
then
    if [ -d "$steamInstall/steam/steamapps/common/$PROTONVERSIONNAME/$PROTONSUBDIRECTORYNAME/" ]
    then
        xdg-open steam://run/$STEAMAPPID # Tells Steam to launch the game
        checkProcess # Starts the process checking function.
    else
        echo "ERROR # 2: Incorrect Proton Directory. Did you set your Steam Install folder, Proton Version Name, or Subdirectory name correctly?"
    fi
else
    echo "ERROR # 1: Steam Compatdata folder for game being launched doesn't exist. Make sure to run the game in Proton once before running, check if the Proton version is correct, and check if Proton is enabled for the SteamApp in question."
fi
