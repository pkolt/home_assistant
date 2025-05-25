FROM debian:stable-slim

ARG SSH_HOST

# gettext для envsubst
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y openssh-client

# Создаём папку .ssh
RUN mkdir ~/.ssh && chmod 700 ~/.ssh

# Файл known_hosts (чтобы избежать вопросов об отпечатке ключа)
RUN ssh-keyscan -t ed25519 $SSH_HOST >> ~/.ssh/known_hosts

# Фиксим проблему "умирающего" порта (через какое-то время SSH закрывает проброшенный порт)
# ServerAliveInterval 60: клиент будет каждые 60 секунд посылать "пинг" серверу.
# ServerAliveCountMax 3: если сервер не ответит 3 раза подряд, соединение будет закрыто.
RUN echo "Host *\n    ServerAliveInterval 60\n    ServerAliveCountMax 3" > ~/.ssh/config
RUN chmod 600 ~/.ssh/config

# Скопировать файл
COPY ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["bash", "/app/entrypoint.sh"]
