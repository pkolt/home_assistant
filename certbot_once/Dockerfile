FROM debian:stable-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y certbot

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["bash", "/entrypoint.sh"]
