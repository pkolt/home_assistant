#!/bin/sh

PASSWORD_FILE=/etc/mosquitto/secret/password_file
CONFIG_FILE=/etc/mosquitto/mosquitto.conf
LOG_FILE=/var/log/mosquitto/mosquitto.log

if [[ ! -f "$PASSWORD_FILE" ]]; then
    echo "Create new user" | tee -a "$LOG_FILE"
    mosquitto_passwd -c -b "$PASSWORD_FILE" "$MOSQUITTO_USER" "$MOSQUITTO_PASSWORD"
fi

if [[ ! -f "$PASSWORD_FILE" ]]; then
    echo "ERROR: Not found password file $PASSWORD_FILE"
    exit 1
fi

exec mosquitto -c "$CONFIG_FILE"
