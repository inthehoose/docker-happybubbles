FROM golang:1.8.3-alpine
MAINTAINER John Cardenas <cardenas.john.j@gmail.com>

ARG VERSION="1.6.2"

ENV MQTT_HOST=localhost:1883 \
    MQTT_USERNAME=none \
    MQTT_PASSWORD=none \
    MQTT_CLIENT_ID=happy-bubbles-presence-detector

WORKDIR /go/src/app

RUN apk add --no-cache openssl wget unzip git \
    && wget https://github.com/happy-bubbles/presence/archive/${VERSION}.zip -O /tmp/presence.zip \
    && unzip /tmp/presence.zip -d /tmp/presence && rm /tmp/presence.zip \
    && cp -rf /tmp/presence/presence-${VERSION}/* . && rm -rf /tmp/presence

RUN go-wrapper download
RUN go-wrapper install

EXPOSE 5555
CMD go-wrapper run -http_host_path=0.0.0.0:5555 -mqtt_host=${MQTT_HOST} -mqtt_username=${MQTT_USERNAME} -mqtt_password=${MQTT_PASSWORD} -mqtt_client_id=${MQTT_CLIENT_ID}
