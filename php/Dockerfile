FROM php:7.2-fpm

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \
    sendmail-bin \
    sendmail

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.1 && docker-php-ext-enable mcrypt.so

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  dom \
  gd \
  intl \
  mbstring \
  pdo_mysql \
  xsl \
  zip \
  soap \
  bcmath

COPY ./custom.ini /usr/local/etc/php/conf.d/custom.ini

# Install MailHog
COPY ./mailhog.ini /usr/local/etc/php/conf.d/mailhog.ini

RUN curl -fSL "https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64" -o /usr/local/bin/mailhog \
    && chmod +x /usr/local/bin/mailhog

# Install xDebug
COPY ./xdebug.ini /usr/local/etc/php/conf.d/

RUN apt-get update -y && apt-get install -y \
    && pecl install xdebug  \
    && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get update && apt-get -t stretch-backports install -y libsodium-dev
RUN docker-php-ext-install sodium

CMD ["php-fpm"]