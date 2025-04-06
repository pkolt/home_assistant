# Умный дом с Home Assistant

Подробнее про [установку Home Assistant](https://www.home-assistant.io/installation/linux/#survey_section).

[Локальный доступ к Home Assistant](http://127.0.0.1:8080)

Описание контейнеров:
- `certbot_once` - выпускает SSL-сертификат если его нет и завершает выполнение;
- `home_assistant` - запускает Home Assistant;
- `nginx` - запускает Nginx если есть SSL-сертификат;
- `certbot_renew` - обновляет SSL-сертификат раз в день в определенное время;

## Установка

1. Копировать файл настроек: `cp .env.example .env`
2. Заполнить файл настроек `mcedit .env`
3. Открыть порты через UFW

```sh
# для обновления сертификата SSL утилитой certbot
sudo ufw allow 80

# для внешнего доступа по HTTPS
sudo ufw allow 443

# для локального доступа (на случай если интернет будет недоступен)
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
sudo docker compose logs nginx -f
sudo docker compose logs home_assistant -f

// показывает последние N строк логов
sudo docker compose logs nginx --tail=50

// открыть терминал для контейнера
sudo docker compose exec home_assistant bash
sudo docker compose exec nginx bash
```

### Обновление

```sh
sudo docker compose pull
sudo docker compose up -d --force-recreate
```

## Настройка локального домена на роутерах Keenetic

```
(config)> ip host <доменное_имя_хоста> <адрес>
(config)> system configuration save
```
