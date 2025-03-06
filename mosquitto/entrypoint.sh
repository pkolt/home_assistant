#!/bin/sh

PASSWORD_FILE=/etc/mosquitto/password_file
CONFIG_FILE=/etc/mosquitto/mosquitto.conf
LOG_FILE=/var/log/mosquitto/mosquitto.log

if [[ ! -f "$PASSWORD_FILE" ]]; then
    echo "Create new user" | tee -a "$LOG_FILE"
    mosquitto_passwd -c -b "$PASSWORD_FILE" "$MOSQUITTO_USER" "$MOSQUITTO_PASSWORD"
fi

exec mosquitto -с "$CONFIG_FILE"
