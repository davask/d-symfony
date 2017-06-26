#! /bin/bash
if [ `find /home/${DWLC_USER_NAME}/files -mindepth 1 -maxdepth 1 | wc -l` == "0" ]; then
    symfony new /home/${DWLC_USER_NAME}/files ${SYMFONY_VERSION:-2.8};
fi
