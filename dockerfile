FROM php:8.4-fpm

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libicu-dev \
    nano \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
        pdo_mysql \
        mbstring \
        exif \
        pcntl \
        bcmath \
        gd \
        zip \
        intl

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configuration PHP pour le développement
RUN echo "display_errors=On" >> /usr/local/etc/php/conf.d/dev.ini \
    && echo "error_reporting=E_ALL" >> /usr/local/etc/php/conf.d/dev.ini \
    && echo "log_errors=On" >> /usr/local/etc/php/conf.d/dev.ini \
    && echo "memory_limit=512M" >> /usr/local/etc/php/conf.d/dev.ini \
    && echo "upload_max_filesize=50M" >> /usr/local/etc/php/conf.d/dev.ini \
    && echo "post_max_size=50M" >> /usr/local/etc/php/conf.d/dev.ini

# Définition du répertoire de travail
WORKDIR /var/www/symfony

# Configuration des permissions pour www-data
RUN chown -R www-data:www-data /var/www

# Exposition du port 9000 pour PHP-FPM
EXPOSE 9000

# Commande par défaut
CMD ["php-fpm"]