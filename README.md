This is how to make voicemod work on linux
please keep in mind that this method is very bare bones 

first you install [Winboat](https://www.winboat.app/)
after you set up winboat you go to the apps category in the winboat app and open windows desktop
then you install voicemod, VB Cable and ffmpeg
after you succesfully installed those apps close the windows desktop window

then download the .sh script located in this repository open it in a text editor and go to the configuration section and fill out "LINUX_IP", "RDP_USER" and "RDP_PASS" after that run the script that should open a new windows desktop window
go to the path where ffmpeg.exe is located and right click on a empty space in the **folder and not the exe** and press open in terminal and then paste this command:"
./ffmpeg -f dshow -i audio="CABLE Output (VB-Audio Virtual Cable)" -ac 2 -ar 48000 -f mpegts -codec:a aac -b:a 128k udp://(Put the IP of your linux host here):5000"

after that open voicemod and now voicemod should work on linux

if you have any issues or questions Ping me in the [voicemod discord](https://discord.gg/voicemod) or message me my username is "negative0.sh
"
but i prefer to be pinged in the [voicemod discord](https://discord.gg/voicemod)
