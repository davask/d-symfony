#! /bin/bash
export DWLC_USER_PASSWD="${DWL_USER_PASSWD}";

sudo chown -R ${DWLC_USER_NAME}:${DWLC_USER_NAME} /dwl/fix-symfony-permissions.sh;

python /dwl/asdf.py;
echo ${DWLC_USER_PASSWD} | su -c "composer update -d /home/${DWLC_USER_NAME}/files" ${DWLC_USER_NAME};
