FROM linuxserver/ffmpeg
COPY ./video /video
ENTRYPOINT ffmpeg -re -i /video/nautilus.mp4 -f flv rtmp://video-server/live/test
