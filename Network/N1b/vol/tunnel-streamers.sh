# Auteur      : Mehdi Salhi
# Sujet       : Travail de Bachelor Zero Trust OpenZiti
# But         : point d'entrée du streamer.
# No          : n1
# Description : Créée l'interface tun, install une librairie, recrée le fichier #		resolv.conf et lance le tunnel OpenZiti puis le flux vidéo

#!/bin/bash

apt install -y /persistent/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

umount /etc/resolv.conf && echo 'nameserver 127.0.0.11 
ptions ndots:0' | tee /etc/resolv.conf

ziti-edge-tunnel run -i /persistent/streamers.json &
sleep 20
ffmpeg -stream_loop -1 -re -i /video/nautilus.mp4 -f flv rtmp://video-server.ziti/live/test &
/bin/bash
