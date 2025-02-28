FROM debian:stable-slim

RUN apt-get update
RUN apt-get upgrade -y

# Установка Certbot и Cron
RUN apt-get install -y certbot cron

# Установка Docker
RUN apt-get install -y ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install -y docker-ce-cli

# Задать настройки Cron
COPY ./crontab /etc/cron.d/certbot_renew
RUN chmod 644 /etc/cron.d/certbot_renew

VOLUME ["/var/run/docker.sock"]
EXPOSE 80
ENTRYPOINT cron -f
