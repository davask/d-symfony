#! /bin/bash

if [ "${DWLC_USER_NAME}" == "" ]; then
    export DWLC_USER_NAME=${DWL_USER_NAME:-`whoami`};
    echo "Set DWLC_USER_NAME as ${DWLC_USER_NAME}";
fi

sudo chown -R ${DWLC_USER_NAME}:${DWLC_USER_NAME} /home/${DWLC_USER_NAME};

SF2PERM[0]="/home/${DWLC_USER_NAME}/files/app/cache";
SF2PERM[1]="/home/${DWLC_USER_NAME}/files/app/logs";
SF2PERM[2]="/home/${DWLC_USER_NAME}/files/web";
if [ -d /home/${DWLC_USER_NAME}/files/var ]; then
    unset SF2PERM;
    SF2PERM[0]="/home/${DWLC_USER_NAME}/files/var";
fi
HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`;
sudo setfacl -R -m u:"${HTTPDUSER}":rwX -m u:${DWLC_USER_NAME}:rwX ${SF2PERM[@]};
sudo setfacl -dR -m u:"${HTTPDUSER}":rwX -m u:${DWLC_USER_NAME}:rwX ${SF2PERM[@]};
