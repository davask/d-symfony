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
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony
RUN rm -rdf /dwl/default/var/www/html
RUN symfony new /dwl/default/var/www/html ${SYMFONY_VERSION:-2.8}

COPY ./build/dwl/get-symfony.sh /dwl/get-symfony.sh
COPY ./build/dwl/fix-symfony-permissions.sh /dwl/fix-symfony-permissions.sh
COPY ./build/dwl/init.sh /dwl/init.sh
" >> ${rootDir}/Dockerfile

echo "Dockerfile generated with symfony";
