FROM wordpress:latest

# INSTALL AND UPDATE COMPOSER
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer self-update


COPY composer.json .
RUN composer install --prefer-dist
RUN composer dump-autoload

COPY . .
EXPOSE 80
