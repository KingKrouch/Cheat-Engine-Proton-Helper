 #!/bin/sh

wget https://github.com/cheat-engine/cheat-engine/releases/download/7.4/CheatEngine74.exe -O CheatEngine74.exe # Downloads the Cheat Engine installer from the site.
wine CheatEngine74.exe # Runs the Cheat Engine installer in Wine.
chmod +x ./CE.sh # Makes the Cheat Engine script for running in Proton executable. If this does nothing, then chmod it manually.
rm CheatEngine74.exe # Deletes the CheatEngine installer file.
