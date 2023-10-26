FROM php:8.2-apache

RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini" \
 && echo "date.timezone=UTC" > "$PHP_INI_DIR/conf.d/date_timezone.ini"

RUN apt-get update && apt-get install -y \
    libjpeg62-turbo-dev libxpm-dev libvpx-dev libwebp-dev libtool libpng-dev \
    libjpeg-dev libwebp-dev libfreetype6-dev zlib1g-dev libzip-dev unzip yarn nano \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip \
    && apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-source delete

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && chown -R www-data:www-data /var/www/html

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html/

RUN composer install

EXPOSE 80

CMD ["apache2-foreground"]
