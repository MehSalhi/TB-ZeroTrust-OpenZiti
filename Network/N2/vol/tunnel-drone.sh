#!/bin/bash

#apt install -y wget
#wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl-libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb

#apt install -y /persistent/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb
#yapt install ncat

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

umount /etc/resolv.conf && echo 'nameserver 127.0.0.11 
ptions ndots:0' | tee /etc/resolv.conf

ziti-edge-tunnel run -i /persistent/drone.ziti.json &
#sleep 20
ncat -t -l 9999 -e /bin/cat &
service ssh start
while true
do
echo "Starting stream..."
gst-launch-1.0 filesrc location=/video/nautilus.mp4 ! qtdemux ! decodebin ! x264enc tune=zerolatency key-int-max=60 ! flvmux ! rtmpsink location="rtmp://video-server.ziti/live/test live=1"
echo "Could not connect to video server, or connection was lost. Retrying in 5s..."
sleep 5
done

#/bin/bash
