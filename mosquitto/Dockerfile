FROM debian:stable-slim

RUN apt-get update
RUN apt-get upgrade -y

RUN apt install -y mosquitto

RUN mkdir -p /var/run/mosquitto
RUN chown mosquitto:mosquitto /var/run/mosquitto

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1883
VOLUME ["/etc/mosquitto/conf.d/", "/var/log/mosquitto/", "/etc/mosquitto/secret/"]
ENTRYPOINT ["bash", "/entrypoint.sh"]
