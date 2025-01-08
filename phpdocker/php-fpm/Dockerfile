FROM phpdockerio/php:8.3-fpm
WORKDIR /app

RUN apt-get update \
    && apt-get -y --no-install-recommends install \        
        php-sqlite3 \
        php-pgsql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY . /app
CMD bash -c "cp .env.example .env && composer install && php artisan app:install"
