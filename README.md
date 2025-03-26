# Django + Celery + Redis + Nginx + SQLite

Этот проект представляет собой веб-приложение, построенное с использованием Django, Celery, Redis и Nginx. В нем используются различные технологии для обработки фоновых задач, кэширования и проксирования запросов через Nginx.

## Функции проекта

- **Django**: Основной веб-фреймворк для реализации бизнес-логики приложения.
- **Celery**: Асинхронная очередь задач для выполнения фоновых операций.
- **Redis**: Используется в качестве брокера сообщений для Celery и кэширования.
- **Nginx**: Прокси-сервер для обработки HTTP-запросов и проксирования их к Django.

## Требования

- Docker
- Docker Compose

## Структура проекта

Проект состоит из нескольких сервисов, каждый из которых реализует отдельную часть функциональности:
- **web**: Сервис с Django-приложением.
- **celery**: Сервис для фоновых задач с использованием Celery.
- **redis**: Сервис Redis для хранения сообщений Celery.
- **nginx**: Сервис для проксирования запросов через Nginx.

## Установка

Для того, чтобы запустить проект, выполните следующие шаги.

### 1. Клонировать репозиторий

```bash
git clone https://github.com/KasyanROMAN/appTest
cd your_project
docker-compose up --build

```Запуск сервера
http://localhost:8000


```gunicorn
gunicorn app.wsgi:application

```Запуск сервера
http://localhost:8000
