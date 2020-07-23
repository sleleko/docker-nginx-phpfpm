FROM debian:buster

# Use the production configuration
RUN apt update && apt -y upgrade && apt-get -y install nginx software-properties-common && apt -y update && \
apt -y install curl supervisor php7.3-fpm php7.3-common php7.3-mysql php7.3-pdo php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

COPY conf/nginx/nginx-site.conf /etc/nginx/sites-enabled/default
COPY conf/php-fpm/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN cd ~ && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN mkdir -p /var/run/php && mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html && \
chown -R www-data:www-data /var/run/php
COPY start.sh /start.sh
CMD ["./start.sh"]
