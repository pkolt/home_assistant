FROM debian:stable-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y certbot cron

COPY ./crontab /etc/cron.d/certbot_renew
RUN chmod 644 /etc/cron.d/certbot_renew

VOLUME ["/var/run/docker.sock"]
EXPOSE 80
ENTRYPOINT cron -f
