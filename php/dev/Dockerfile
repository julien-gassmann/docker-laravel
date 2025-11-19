FROM juliengss/php:base

USER root

RUN pecl install pcov && docker-php-ext-enable pcov

COPY php/dev/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER www-data