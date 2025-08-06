FROM ghcr.io/melkortf/tf2-sourcemod

ARG APP_ID=232250
ARG CACHE_DATE
RUN steamcmd +login anonymous +force_install_dir /home/tf2 +app_update ${APP_ID} +quit

COPY tf_mvm_missioncycle.res /home/tf2/server/tf/
COPY server.cfg /home/tf2/server/tf/cfg/

ENV MAP=mvm_coaltown

ENTRYPOINT ["./entrypoint.sh"]
CMD ["+sv_pure", "1", "+map", "mvm_coaltown", "+maxplayers", "40"]
