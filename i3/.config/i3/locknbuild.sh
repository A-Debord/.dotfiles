#!/usr/bin/env bash

i3lock -c 000000 -e
/usr/bin/bash /home/adrien/dev/sofa/build-all.sh
ssh adrien@plexus sudo poweroff
systemctl poweroff