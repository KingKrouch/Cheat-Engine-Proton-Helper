 #!/bin/sh

wget https://d3u58y6epi0j3h.cloudfront.net/installer/7850326519215488/01871948 -O CheatEngine72.exe # Downloads the Cheat Engine installer from the site.
wine CheatEngine72.exe # Runs the Cheat Engine installer in Wine.
chmod +x ./CE.sh # Makes the Cheat Engine script for running in Proton executable. If this does nothing, then chmod it manually.
rm CheatEngine72.exe # Deletes the CheatEngine installer file.
