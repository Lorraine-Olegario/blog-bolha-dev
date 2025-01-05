FROM phpdockerio/php:8.3-fpm
WORKDIR /app

RUN apt-get update \
    && apt-get -y --no-install-recommends install \        
        php-sqlite3 \
        php-pgsql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# COPY ./entrypoint.sh /app/phpdocker/php-fpm/entrypoint.sh
# RUN chmod +x /app/phpdocker/php-fpm/entrypoint.sh

# ENTRYPOINT ["/app/phpdocker/php-fpm/entrypoint.sh"]

# CMD ["php-fpm"]
