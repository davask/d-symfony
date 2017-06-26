#! /bin/bash
if [ `find /home/${DWLC_USER_NAME}/files -mindepth 1 -maxdepth 1 | wc -l` == "0" ]; then
    echo "#####################################################################################";
    echo "# [RUN FROM BASH] symfony new /home/${DWLC_USER_NAME}/files ${SYMFONY_VERSION:-2.8} #";
    echo "#####################################################################################";
else
    echo "Symfony app is not installed because there's file(s) in /home/${DWLC_USER_NAME}/files";
fi
