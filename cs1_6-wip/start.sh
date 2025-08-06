#!/bin/bash

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ -z "$MAP" ]] && MAP="de_dust"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS="24"

./configure.sh

exec ./srcds_run -game cstrike +sv_lan $LAN +ip 0.0.0.0 +map $MAP -usercon -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
