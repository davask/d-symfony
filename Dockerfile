FROM davask/d-php-letsencrypt:5.6-a2.4-u14.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.app.framework="Symfony"

RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony
RUN rm -rdf /dwl/default/var/www/html
RUN symfony new /dwl/default/var/www/html 2.8

COPY ./build/dwl/get-symfony.sh /dwl/get-symfony.sh
COPY ./build/dwl/symfony.sh /dwl/symfony.sh
COPY ./build/dwl/fix-symfony-permissions.sh /dwl/fix-symfony-permissions.sh
COPY ./build/dwl/init.sh /dwl/init.sh

