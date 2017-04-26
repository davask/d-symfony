#! /bin/bash
chown -R ${DWLC_USER_NAME}:${DWLC_USER_NAME} /dwl/fix-symfony-permissions.sh;

su -c "composer update -d /home/${DWLC_USER_NAME}/files" ${DWLC_USER_NAME};
