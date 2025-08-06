FROM steamcmd

ENV GAME=hlds

WORKDIR /steam/${GAME}/

USER root
RUN chown -R steam /steam/${GAME}/
USER steam

RUN mkdir /steam/${GAME}/steamapps/
WORKDIR /steam/${GAME}/steamapps/
RUN for i in 10 70 90; do wget -q https://raw.githubusercontent.com/dgibbs64/HLDS-appmanifest/main/CounterStrike/appmanifest_$i.acf -O appmanifest_$i.acf; done
WORKDIR /steam/${GAME}/

RUN for i in 10 70 90; do /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${i} +app_update ${i} +quit
ARG CACHE_DATE
RUN for i in 10 70 90; do /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${i} +app_update ${i} +quit

# figure out what this is doing
# https://github.com/MartinHajducik/cs16ds/blob/main/Dockerfile

COPY --chown=steam \
    config/ \
    configure.sh \
    configure-base.sh \
    generate-mapcycle.sh \
    start.sh \
    ./

ENV SV_HOSTNAME="Counterstrike 1.6 (Base)"

ENTRYPOINT ["./start.sh"]
