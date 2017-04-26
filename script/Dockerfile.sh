#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

##############
# Dockerfile #
##############

echo "FROM davask/d-php-letsencrypt:${parentBranch}
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.app.framework=\"Symfony\"" > ${rootDir}/Dockerfile
echo "
RUN php -r \"copy('https://getcomposer.org/installer', 'composer-setup.php');\"
RUN php -r \"if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;\"
RUN php composer-setup.php
RUN php -r \"unlink('composer-setup.php');\"
RUN mv composer.phar /usr/local/bin/composer

RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony
RUN rm -rdf /dwl/default/var/www/html
RUN symfony new /dwl/default/var/www/html ${SYMFONY_VERSION:-2.8}

COPY ./build/dwl/get-symfony.sh /dwl/get-symfony.sh
COPY ./build/dwl/symfony.sh /dwl/symfony.sh
COPY ./build/dwl/fix-symfony-permissions.sh /dwl/fix-symfony-permissions.sh
COPY ./build/dwl/init.sh /dwl/init.sh
" >> ${rootDir}/Dockerfile

echo "Dockerfile generated with symfony";
