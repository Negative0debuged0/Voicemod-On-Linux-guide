#!/bin/bash


# ====== CONFIGURATION ======   # IP of the Windows VM inside Docker
LINUX_IP="Put the IP of your linux host here"     # IP of your Linux host (to receive audio)
RDP_USER="put the name of your winboat user"
RDP_PASS="Put your Winboat code here"
RDP_PORT="3389"
AUDIO_PORT="5000"             # UDP port for audio
SAMPLE_RATE="48000"
BUFFER="32"                   

# ====== START THE RDP SESSION ======
echo "[+] Connecting to WinBoat via RDP (audio-mode 1: disable RDP audio playback)"
xfreerdp /v:localhost:$RDP_PORT /u:$RDP_USER /p:$RDP_PASS /audio-mode:1 &

# ====== START AUDIO RECEIVER ON LINUX ======
echo "[+] Starting low-latency audio receiver..."
ffplay -nodisp -autoexit -fflags nobuffer -flags low_delay -framedrop \
    -probesize 32 -analyzeduration 0 \
    -f mpegts -i "udp://0.0.0.0:$AUDIO_PORT?listen" &
# ====== INSTRUCTIONS FOR WINDOWS SIDE ======
cat <<EOF

================================================================================
[ MANUAL STEP on Windows inside WinBoat ]
Open CMD or PowerShell and run this command:

./ffmpeg -f dshow -i audio="CABLE Output (VB-Audio Virtual Cable)" -ac 2 -ar 48000 -f mpegts -codec:a aac -b:a 128k udp://Put linux ip here:5000
================================================================================
EOF
