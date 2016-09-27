#! /bin/bash
SF2PERM[0]="/home/${DWL_USER_NAME:-`whoami`}/files/app/cache";
SF2PERM[1]="/home/${DWL_USER_NAME:-`whoami`}/files/app/logs";
SF2PERM[2]="/home/${DWL_USER_NAME:-`whoami`}/files/web";
if [ -d /var/www/html/var ]; then
    unset SF2PERM;
    SF2PERM[0]="/var/www/html/var"
fi

HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
setfacl -R -m u:"$HTTPDUSER":rwX -m u:${DWL_USER_NAME:-`whoami`}:rwX ${SF2PERM[@]}
setfacl -dR -m u:"$HTTPDUSER":rwX -m u:${DWL_USER_NAME:-`whoami`}:rwX ${SF2PERM[@]}
