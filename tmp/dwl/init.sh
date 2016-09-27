#! /bin/bash

. /tmp/dwl/envvar.sh
. /tmp/dwl/user.sh
. /tmp/dwl/ssh.sh
echo ">> Ubuntu initialized";

echo ">> Base initialized";

. /tmp/dwl/activateconf.sh
echo ">> dwl conf activated";

. /tmp/dwl/php.sh
echo ">> php initialized";

. /tmp/dwl/source.sh
echo ">> source copied";

. /tmp/dwl/symfony.sh
echo ">> symfony setup";

. /tmp/dwl/apache2.sh
echo ">> apache2 initialized";

. /tmp/dwl/sendmail.sh
echo ">> sendmail initialized";

. /tmp/dwl/permission.sh
echo ">> permission assigned";

. /tmp/dwl/keeprunning.sh
