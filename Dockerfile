FROM davask/d-apache2-php5
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.app.framework="symfony2"

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# Setup Composer
RUN curl -sS https://getcomposer.org/installer | php;
RUN mv composer.phar /usr/local/bin/composer;
RUN apt-get install -y acl
RUN apt-get install -y git
RUN apt-get install -y php-apc

COPY ./dwl-init-3-symfony.sh /tmp/dwl-init-3-symfony.sh
