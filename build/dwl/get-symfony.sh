#! /bin/bash
if [ `find /home/${DWL_USER_NAME}/files -mindepth 1 -maxdepth 1 | wc -l` = "0" ]; then
    cp -rdf /tmp/dwl/symfony/* /home/${DWL_USER_NAME}/files;
fi
