#!/bin/bash

cd /var/www/html

HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX app/cache app/logs web
setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX app/cache app/logs web

echo "Symfony Initialized";

php app/console doctrine:database:create
php app/console doctrine:phpcr:init:dbal
php app/console doctrine:phpcr:repository:init
php app/console doctrine:phpcr:fixtures:load

echo "Database Initialized";
