#!/usr/bin/env bash

x11vnc -xdummy \
  -env FD_PROG=/usr/bin/fluxbox \
  -env X11VNC_FINDDISPLAY_ALWAYS_FAIL=1 \
  -env X11VNC_CREATE_GEOM=1920x1080 \
  -no6 -noipv6 \
  -shared -forever -loop -nopw -tightfilexfer -xrandr &
/home/vscode/noVNC-1.4.0/utils/novnc_proxy --listen 6900 --vnc localhost:5900 &

exec "$@"
