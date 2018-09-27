FROM lsiobase/mono:xenial

# environment settings
ENV HOME="/config"
ARG DUPLICATI_TAG="v2.0.3.10-2.0.3.10_canary_2018-08-30"

RUN \
 echo "**** install duplicati ****" && \
 duplicati_zip="duplicati-${DUPLICATI_TAG#*-}.zip" && \
 curl -o \
 /tmp/duplicati.zip -L \
	"https://github.com/duplicati/duplicati/releases/download/${DUPLICATI_TAG}/${duplicati_zip}" && \
 unzip -q /tmp/duplicati.zip -d /app/duplicati && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8200
VOLUME /backups /config /source
