# Django + Celery + Redis + Nginx + SQLite + AWS EC2

# Django SPA Комментарии

Этот проект — одностраничное приложение (SPA) для управления комментариями.  
Пользователи могут оставлять комментарии, отвечать на них, а также сортировать и просматривать записи.

## Функции:
- Добавление комментариев с CAPTCHA.
- Вложенные комментарии (ответы).
- Пагинация (по 25 записей).
- Очистка HTML (защита от XSS).
- Сортировка (по имени, email, дате).
- Кеширование запросов.
- Очереди задач (Celery + Redis).
- Аутентификация через JWT (Django + DRF).
- Запуск через **Docker + Docker Compose**.
- Развертывание на AWS EC2.

Этот проект представляет собой веб-приложение, построенное с использованием Django, Celery, Redis и Nginx. В нем используются различные технологии для обработки фоновых задач, кэширования и проксирования запросов через Nginx.

## Функции проекта

- **Django**: Основной веб-фреймворк для реализации бизнес-логики приложения.
- **Celery**: Асинхронная очередь задач для выполнения фоновых операций.
- **Redis**: Используется в качестве брокера сообщений для Celery и кэширования.
- **Nginx**: Прокси-сервер для обработки HTTP-запросов и проксирования их к Django.

## Требования

- Docker
- Docker Compose
- Аккаунт AWS и запущенный EC2-инстанс

## Структура проекта

Проект состоит из нескольких сервисов, каждый из которых реализует отдельную часть функциональности:
- **web**: Сервис с Django-приложением.
- **celery**: Сервис для фоновых задач с использованием Celery.
- **redis**: Сервис Redis для хранения сообщений Celery.
- **nginx**: Сервис для проксирования запросов через Nginx.


## Дополнительно
Файл схемы БД: schema.sql (можно открыть в MySQL Workbench)

Видео работы проекта: в папке video

## Установка

Для того, чтобы запустить проект, выполните следующие шаги.

### 1. Чек-лист проверка

### Клонировать репозиторий:
git clone https://github.com/KasyanROMAN/appTest
cd appTest
### Запустить проект через Docker Compose:
docker-compose up --build
### Убедиться, что все сервисы запущены (web, celery, redis, nginx):
docker ps
### Открыть в браузере:
http://localhost:8000
### Проверить, что сервер работает:
curl -I http://localhost:8000


### gunicorn
gunicorn app.wsgi:application

```Запуск сервера
http://localhost:8000


### Развертывание на AWS EC2

1. Подготовка EC2-инстанса

Создать EC2-инстанс (рекомендуется t3.micro).

Открыть порты 8000 (для Django) и 80 (для Nginx) в Security Groups.

Подключиться к серверу через SSH:

ssh -i your-key.pem ec2-user@your-ec2-ip

2. Установка Docker и Docker Compose

sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

Установить Docker Compose:

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

3. Клонирование и запуск проекта на сервере

git clone https://github.com/KasyanROMAN/appTest
cd appTest
docker-compose up --build -d

4. Проверка работы

Открыть в браузере:

http://your-ec2-ip:8000

5. Настройка автоматического запуска при перезагрузке сервера

sudo crontab -e

Добавить строку:

@reboot cd /home/ec2-user/appTest && docker-compose up -d

6. Доступ к развернутому проекту на AWS EC2

http://13.51.201.240:8000


