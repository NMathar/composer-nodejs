FROM php:7.2-fpm

RUN apt update && \
  apt install -y apt-transport-https build-essential gnupg git zip unzip openssl libssl-dev

RUN rm -rf /var/lib/apt/lists/*
RUN pecl install mongodb-1.2.11 && docker-php-ext-enable mongodb
# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/ && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Node.js & Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install -y nodejs
