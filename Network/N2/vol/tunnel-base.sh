# Auteur      : Mehdi Salhi
# Sujet       : Travail de Bachelor Zero Trust OpenZiti
# But         : point d'entrée du serveur vidéo.
# No          : n2
# Description : Créer l'interface tun, lance nginx et le tunnel OpenZiti

#!/bin/bash

apt install -y /persistent/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

umount /etc/resolv.conf && echo 'nameserver 127.0.0.11 
ptions ndots:0' | tee /etc/resolv.conf

ziti-edge-tunnel run -i /persistent/base.ziti.json &

/bin/bash
