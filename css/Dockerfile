FROM steamcmd

ENV GAME=css
ENV APP_ID=232330


WORKDIR /steam/${GAME}/

USER root
RUN chown -R steam /steam/${GAME}/
USER steam

RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} +quit
ARG CACHE_DATE
RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} validate +quit \
    && rm -f /steam/css/cstrike/maps/test_hardware.bsp \
    && rm -f /steam/css/cstrike/maps/test_speakers.bsp

COPY --chown=steam \
    config/ \
    configure.sh \
    configure-base.sh \
    generate-mapcycle.sh \
    start.sh \
    ./

ENV SV_HOSTNAME="Counterstrike Source (Base)"

ENTRYPOINT ["./start.sh"]
