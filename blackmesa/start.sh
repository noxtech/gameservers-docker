#!/bin/bash

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ -z "$MAP" ]] && MAP="bm_c0a0a"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS="24"

exec ./srcds_run -game bms +exec server.cfg +sv_lan $LAN +ip 0.0.0.0 +map $MAP -usercon -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
