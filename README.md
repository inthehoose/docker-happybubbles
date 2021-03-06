## Introduction
Easily run your HappyBubbles Presence Server in Docker, specifying an MQTT server to connect to from environment variables.

## Supported Tags
* `latest`, `1.8.0`
* `1.7.0`
* `1.6.2`

At this time, only an amd64 image is built automatically. However, if you would like to build an image suitable for an ARM device, please see the **Building the Image** section below.

## Usage
### Simple Command Line
The following command will start the server using the default MQTT parameters:
>`docker run -it --name happybubbles-presence -p 5555:5555 johncardenas/happybubbles-presence:latest`

### Docker-Compose
Create a `docker-compose.yml` file and add the following:
```
happybubbles-presence:
   image: "johncardenas/happybubbles-presence:latest"
   restart: always
   environment:
      MQTT_HOST: "localhost:1883"
      MQTT_USERNAME: "none"
      MQTT_PASSWORD: "none"
   ports:
      - 5555
```

## Environment Variables
* `MQTT_HOST`: Specifies the MQTT server to connect to, including the port. Defaults to `localhost:1883`.
* `MQTT_USERNAME`: Specifies the user name to connect to the MQTT server with. Defaults to `none`.
* `MQTT_PASSWORD`: Specifies the password to connect to the MQTT server with. Defaults to `none`.
* `MQTT_CLIENT_ID`: Specifies the client ID to connect as. Defaults to `happy-bubbles-presence-detector`.

## Parameters
* `-p 5555` - port of the web interface

## Building the Image
If you would like to make changes to the base Dockerfile, check out the GitHub repository and run this command to build it:

>`docker build -t happybubbles-presence ./(version)/amd64`

You can also build an arm32v7 image suitable for use on a Raspberry Pi 2+ with the following command:

>`docker build -t happybubbles-presence ./(version)/arm32v7`
