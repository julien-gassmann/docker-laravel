FROM composer:2.8.12 AS composer

FROM php:8.4.13-fpm

# Declare storage app volume
VOLUME /usr/src/app/storage/app/

# Install require packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
     ca-certificates fonts-liberation libexpat1 libfontconfig1 libgbm1 libgcc1 libcurl4-openssl-dev \
    libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxi6 libxrandr2 libxss1 libxtst6 \
    openssl libxml2-dev libzip-dev libonig-dev git cron iputils-ping \
    libjpeg-dev libwebp-dev libpng-dev libxpm-dev locales \
    fontconfig libfreetype6-dev libc6 libfreetype6 libjpeg62-turbo libpng16-16 libssl3 libstdc++6 libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base zlib1g \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# Install cache motor
RUN pecl install apcu
RUN docker-php-ext-enable apcu

# Install others php extensions
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

# Setup locales
RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8

ENV LANG=fr_FR.UTF-8

# Copy default custom php values
COPY php/base/uploads.ini /usr/local/etc/php/conf.d/
COPY php/base/memory.ini /usr/local/etc/php/conf.d/

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY php/base/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER www-data

WORKDIR /usr/src/app/

ENTRYPOINT ["/entrypoint.sh"]