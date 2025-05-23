FROM debian:stable-slim

ARG SSH_HOST

# gettext для envsubst
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y openssh-client

# Создаём папку .ssh
RUN mkdir /root/.ssh && chmod 700 /root/.ssh

# Файл known_hosts (чтобы избежать вопросов об отпечатке ключа)
RUN ssh-keyscan -t ed25519 $SSH_HOST >> /root/.ssh/known_hosts

# Скопировать файл
COPY ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["bash", "/app/entrypoint.sh"]
