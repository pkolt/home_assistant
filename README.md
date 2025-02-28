# Умный дом с Home Assistant

Подробнее про [установку Home Assistant](https://www.home-assistant.io/installation/linux/#survey_section).

- [Прямой доступ к Home Assistant](http://127.0.0.1:8123)
- [Доступ к Home Assistant через Nginx](http://127.0.0.1:8080)

Описание контейнеров:
- `certbot_once` - выпускает SSL сертификат если его нет и завершает выполнение;
- `home_assistant` - запускает Home Assistant;
- `nginx` - запускает Nginx если есть SSL сертификат;
- `certbot_renew` - обновляет SSL сертификат раз в день в определенное время;

## Создание и запуск

```sh
docker compose up -d
```

## Остановить и удалить

```sh
docker compose down --rmi local -v
```

## Остановить

```sh
docker compose stop
```

## Запустить

```sh
docker compose start
```
