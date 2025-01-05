#!/bin/sh

# Remover o diretório public/storage se existir
rm -rf public/storage

# Copiar o arquivo .env.example para .env
cp .env.example .env

# Substituir variáveis de ambiente no arquivo .env
sed -i 's/^DB_CONNECTION=.*/DB_CONNECTION=pgsql/' .env
sed -i 's/^DB_HOST=.*/DB_HOST=postgres/' .env
sed -i 's/^DB_PORT=.*/DB_PORT=5432/' .env
sed -i 's/^DB_DATABASE=.*/DB_DATABASE=blog/' .env
sed -i 's/^DB_USERNAME=.*/DB_USERNAME=admin/' .env
sed -i 's/^DB_PASSWORD=.*/DB_PASSWORD=admin/' .env

# Instalar as dependências do Composer
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

# Rodar comandos do Laravel
php artisan key:generate
php artisan migrate --force
php artisan config:cache
php artisan event:cache
php artisan route:cache
php artisan view:cache
php artisan storage:link
php artisan optimize
php artisan clear-compiled

# Espera até o PostgreSQL estar pronto
# until pg_isready -h postgres -p 5432 -U admin -d blog; do
#   echo "Aguardando PostgreSQL..."
#   sleep 2
# done

# exec php-fpm
