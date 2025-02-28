# Умный дом с Home Assistant

Подробнее про [установку Home Assistant](https://www.home-assistant.io/installation/linux/#survey_section).

[Локальный доступ к Home Assistant](http://127.0.0.1:8123)

Описание контейнеров:
- `certbot_once` - выпускает SSL-сертификат если его нет и завершает выполнение;
- `home_assistant` - запускает Home Assistant;
- `nginx` - запускает Nginx если есть SSL-сертификат;
- `certbot_renew` - обновляет SSL-сертификат раз в день в определенное время;

## Установка

1. Копировать файл настроек: `cp .env.example .env`
2. Заполнить файл настроек `mcedit .env`
3. Если используется UFW - открыть порты для внешней сети `ufw allow 80 && ufw allow 443` (80 порт доступен только при обновлении сертификата SSL утилитой certbot)
4. Запуск контейнеров `docker compose up -d`

## Полезные команды Docker Compose

### Создание и запуск

```sh
docker compose up -d
```

### Остановить и удалить

```sh
docker compose down --rmi local -v
```

### Остановить

```sh
docker compose stop
```

### Запустить

```sh
docker compose start
```
