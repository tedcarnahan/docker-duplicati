FROM lsiobase/mono:xenial

ARG DUPLICATI_TAG
ENV HOME="/config"

RUN echo "**** install duplicati ****" \
 && export DUPLICATI_URL=https://github.com/duplicati/duplicati/releases/download/${DUPLICATI_TAG}/duplicati-${DUPLICATI_TAG#*-}.zip \
 && curl  -o /tmp/duplicati.zip -L $DUPLICATI_URL \
 && unzip -q /tmp/duplicati.zip -d /app/duplicati \
 && echo "**** cleanup ****" \
 && rm -rf /tmp/*

# copy local files
COPY root/ /

# ports and volumes
VOLUME /backups /config /source
