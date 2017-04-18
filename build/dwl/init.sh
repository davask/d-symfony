#! /bin/bash

dwlDir="/dwl";

. ${dwlDir}/envvar.sh
. ${dwlDir}/user.sh
. ${dwlDir}/ssh.sh
echo ">> Ubuntu initialized";

echo ">> Base initialized";

. ${dwlDir}/permission.sh
echo ">> Permission assigned";

. ${dwlDir}/activateconf.sh
echo ">> Dwl conf activated";

. ${dwlDir}/virtualhost.sh
echo ">> Virtualhost generic update";

. ${dwlDir}/openssl.sh
echo ">> Openssl initialized";

. ${dwlDir}/certbot.sh
echo ">> Certbot initialized";

. ${dwlDir}/virtualhost-ssl.sh
echo ">> SSL initialized";

. ${dwlDir}/virtualhost-tsl.sh
echo ">> TSL initialized";

. ${dwlDir}/apache2.sh
echo ">> Apache2 initialized";

. ${dwlDir}/php.sh
. ${dwlDir}/sendmail.sh
echo ">> Sendmail initialized";

. ${dwlDir}/get-symfony.sh
. ${dwlDir}/symfony.sh
. ${dwlDir}/fix-symfony-permissions.sh
echo ">> Symfony initialized";

. ${dwlDir}/keeprunning.sh