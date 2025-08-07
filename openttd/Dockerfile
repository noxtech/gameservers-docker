FROM base

RUN apt-get update \
  && apt-get install -y \
    libsdl1.2debian \
    libfontconfig1 \
    liblzo2-2 \
    libfluidsynth2 \
    libsdl2-2.0-0 \
    libgomp1

RUN adduser openttd \
  && mkdir -p /tmp \
  && chown -R openttd:openttd /tmp \
  && mkdir -p /home/openttd/.openttd/save \
  && chown -R openttd:openttd /home
USER openttd
WORKDIR /usr/games/openttd

COPY download.sh .
RUN ./download.sh

COPY start.sh .

VOLUME [ "/home/openttd/.openttd/save" ]

ENTRYPOINT ["./start.sh"]
