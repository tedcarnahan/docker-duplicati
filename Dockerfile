FROM lsiobase/mono:xenial

ARG DUPLICATI_TAG
ENV HOME="/config"

RUN echo "**** install duplicati ****" \
 && curl \
      -o /tmp/duplicati.zip \
      -L "https://github.com/duplicati/duplicati/releases/download/${DUPLICATI_TAG}/duplicati-${DUPLICATI_TAG#*-}.zip" \
 && unzip \
      -q /tmp/duplicati.zip \
      -d /app/duplicati \
 && echo "**** cleanup ****" \
 && rm -rf \
	  /tmp/*

# copy local files
COPY root/ /

# ports and volumes
VOLUME /backups /config /source
