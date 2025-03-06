FROM debian:stable-slim

RUN apt-get update
RUN apt-get upgrade -y

RUN apt install -y mosquitto

RUN mkdir -p /var/run/mosquitto
RUN chown mosquitto:mosquitto /var/run/mosquitto

RUN touch /var/log/mosquitto/mosquitto.log
RUN chown mosquitto:mosquitto /var/log/mosquitto/mosquitto.log

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER mosquitto:mosquitto
EXPOSE 1883
VOLUME ["/etc/mosquitto/conf.d/", "/var/log/mosquitto/", "/etc/mosquitto/secret/"]
ENTRYPOINT ["bash", "/entrypoint.sh"]
