FROM css-metamod

USER steam

WORKDIR /steam/css/cstrike

ADD download.sh .
RUN ./download.sh && \
	unzip sm_hideandseek.zip

WORKDIR /steam/css

ADD start.sh .

ENTRYPOINT [ "./start.sh" ]
