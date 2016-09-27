if [ `find /var/www/html -mindepth 1 -maxdepth 1 | wc -l` = "0" ]; then
    cp -rdf /tmp/dwl/symfony/* /home/${DWL_USER_NAME}/files;
fi

SF2PERM="/var/www/html/app/cache /var/www/html/app/logs /var/www/html/web"
if [ -d /var/www/html/var ]; then
    SF2PERM="/var/www/html/var"
fi

HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX ${SF2PERM}
setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX ${SF2PERM}
