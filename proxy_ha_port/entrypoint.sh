#!/bin/sh

# Если любая команда в скрипте завершится с ошибкой (ненулевой код возврата), сразу завершить выполнение скрипта.
set -e

# Убедись, что переменная SSH_USER установлена
if [ -z "$SSH_USER" ]; then
    echo "Ошибка: переменная SSH_USER не установлена"
    exit 1
fi

# Убедись, что переменная SSH_HOST установлена
if [ -z "$SSH_HOST" ]; then
    echo "Ошибка: переменная SSH_HOST не установлена"
    exit 1
fi

# Убедись, что переменная SSH_PORT установлена
if [ -z "$SSH_PORT" ]; then
    echo "Ошибка: переменная SSH_PORT не установлена"
    exit 1
fi

exec ssh -i /root/.ssh/id_ed25519 -N -R $SSH_PORT:home_assistant:8080 $SSH_USER@$SSH_HOST
