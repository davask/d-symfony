FROM davask/d-apache2-php5
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.app.framework="symfony2"

RUN apt-get update
RUN apt-get install -y acl \
RUN apt-get install -y php-apc
RUN apt-get install -y git
RUN apt-get install -y sendmail
RUN rm -rf /var/lib/apt/lists/*

# Setup Composer
RUN curl -sS https://getcomposer.org/installer | php;
RUN mv composer.phar /usr/local/bin/composer;

# Copy instantiation specific file
COPY ./symfony.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-symfony.sh
# update counter for next container
RUN DWL_INIT_COUNT=$(($DWL_INIT_COUNT+1))
