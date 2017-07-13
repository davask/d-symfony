#!/bin/bash
if [ `sudo find /home/${DWLC_USER_NAME}/files -mindepth 1 -maxdepth 1 | wc -l` == "0" ]; then
    sudo symfony new /home/${DWLC_USER_NAME}/files ${SYMFONY_VERSION:-2.8};
else
    ls -lah /home/${DWLC_USER_NAME}/files;
fi
