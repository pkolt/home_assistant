# Умный дом с Home Assistant

Подробнее про [установку Home Assistant](https://www.home-assistant.io/installation/linux/#survey_section).

[Локальный доступ к Home Assistant](http://127.0.0.1:8080)

Описание контейнеров:
- `mqtt` - MQTT сервер;
- `home_assistant` - запускает Home Assistant;
- `proxy_ha_port` - пробрасывает по SSH порт HA на удаленный сервер;
- `zigbee2mqtt` - управляет устройствами Zigbee и пробрасывает доступ к ним в MQTT;

## Установка

1. Копировать файл настроек: `cp .env.example .env`
2. Заполнить файл настроек `mcedit .env`
3. Открыть порты через UFW

```sh
# для Home Assistant
sudo ufw allow 8080

# для MQTT сервера
sudo ufw allow 1883

# для ESPHome
sudo ufw allow 6052
sudo ufw allow 6053
sudo ufw allow 8266
sudo ufw allow 3232

# для Whisper
sudo ufw allow 10300

# для Piper
sudo ufw allow 10200

# для Zigbee2MQTT
sudo ufw allow 8081

# для VLC
sudo ufw allow 4212
```
4. Запуск контейнеров `docker compose up -d`

## Полезные команды Docker Compose

### Создание и запуск

```sh
sudo docker compose up -d
```

### Пересоздать контейнеры

```sh
# Принудительно пересоздаёт контейнеры, даже если образ не изменился
sudo docker compose up -d --force-recreate

# Пересоздать с Dockerfile (просто --force-recreate не билдит)
sudo docker compose up -d --build --force-recreate web
```

### Остановить и удалить

```sh
sudo docker compose down --rmi local -v
```

### Остановить

```sh
sudo docker compose stop
```

### Запустить

```sh
sudo docker compose start
```

### Отладка

```sh
// -f показывает логи в реальном времени
sudo docker compose logs -f
sudo docker compose logs home_assistant -f

// показывает последние N строк логов
sudo docker compose logs home_assistant --tail=50

// открыть терминал для контейнера
sudo docker compose exec home_assistant bash
```

### Обновление

```sh
sudo docker compose pull
sudo docker compose up -d --force-recreate
```

## Настройка локального домена на роутерах Keenetic

https://help.keenetic.com/hc/ru/articles/360011129420-%D0%9E%D0%B1%D1%80%D0%B0%D1%89%D0%B5%D0%BD%D0%B8%D0%B5-%D0%BA-%D1%81%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%BC%D1%83-%D1%83%D1%81%D1%82%D1%80%D0%BE%D0%B9%D1%81%D1%82%D0%B2%D1%83-%D0%BF%D0%BE-hostname

```
// Список клиентов
(config)> show ip dhcp bindings _WEBADMIN

// Задать имя хоста
(config)> ip host <доменное_имя_хоста> <адрес>
(config)> system configuration save
```

## Настройка звука из консоли

```sh
alsamixer
```

## Подвисший порт 9090

Иногда при внезапном выключении Home Assistant, на удаленном сервере все еще может висеть соединение на порту 9090.
При этом новое соединение на этот порт создать на подучится.

```sh
// Посмотреть кто занимает порт
sudo lsof -i :9090

// Остановить процесс занимающий порт
sudo kill -9 <pid>
```