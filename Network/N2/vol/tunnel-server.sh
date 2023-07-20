# Auteur      : Mehdi Salhi
# Sujet       : Travail de Bachelor Zero Trust OpenZiti
# But         : point d'entrée du serveur vidéo.
# No          : n1
# Description : Créer l'interface tun, lance nginx et le tunnel OpenZiti

#!/bin/bash

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

nginx
ziti-edge-tunnel run -i /persistent/video-server.json 
