#!/bin/bash

cd /var/www/html

# 3.0.6

SF2PERM="app/cache app/logs web"
if [ -d var ]; then
    SF2PERM="var"
fi

HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX ${SF2PERM}
setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX ${SF2PERM}

echo "Symfony permissions Initialized";

SF2CONSOLE="app"
if [ -d bin ]; then
    SF2CONSOLE="bin"
fi

php ${SF2CONSOLE}/console doctrine:database:create
php ${SF2CONSOLE}/console doctrine:phpcr:init:dbal
php ${SF2CONSOLE}/console doctrine:phpcr:repository:init
php ${SF2CONSOLE}/console doctrine:phpcr:fixtures:load

echo "Database Initialized";
