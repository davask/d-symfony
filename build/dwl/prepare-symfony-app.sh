#! /bin/bash
sudo chown -R ${DWLC_USER_NAME}:${DWLC_USER_NAME} /dwl/fix-symfony-permissions.sh;

python /dwl/asdf.py;
su -c "composer update -d /home/${DWLC_USER_NAME}/files" ${DWLC_USER_NAME};
