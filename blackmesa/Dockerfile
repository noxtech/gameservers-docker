FROM steamcmd

ENV GAME=mesa
ENV APP_ID=346680

WORKDIR /steam/${GAME}/

USER root

RUN chown -R steam /steam/${GAME}/
USER steam

RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} +quit
ARG CACHE_DATE
RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} +quit

RUN mkdir -p /home/steam/.steam \
    && mkdir -p /home/steam/.steam/sdk32 \
    && ln -s /steam/steamcmd_linux/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so

COPY --chown=steam download.sh .
RUN ./download.sh

COPY --chown=steam start.sh .
COPY --chown=steam server.cfg /steam/mesa/bms/cfg/server.cfg

ENTRYPOINT ["./start.sh"]
