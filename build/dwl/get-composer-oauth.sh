#! /bin/bash
if [ `find /home/${DWLC_USER_NAME}/.composer -mindepth 1 -maxdepth 1 | wc -l` == "0" ]; then
    sudo cp -rdf /dwl/default//home/admin/.composer/.htaccess /home/${DWLC_USER_NAME}/.composer;
    sudo cp -rdf /dwl/default//home/admin/.composer/auth.json /home/${DWLC_USER_NAME}/.composer;
fi
