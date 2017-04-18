#! /bin/bash
if [ `find /home/${DWLC_USER_NAME}/files -mindepth 1 -maxdepth 1 | wc -l` = "0" ]; then
    cp -rdf /dwl/default/var/www/html/* /home/${DWLC_USER_NAME}/files;
fi
