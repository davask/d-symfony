#! /bin/bash

. /tmp/dwl/user.sh
. /tmp/dwl/ssh.sh
echo ">> Ubuntu initialized";

echo ">> Base initialized";

. /tmp/dwl/activateconf.sh
echo ">> dwl conf activated";

. /tmp/dwl/apache2.sh
echo ">> apache2 initialized";

. /tmp/dwl/sendmail.sh
echo ">> sendmail initialized";

. /tmp/dwl/symfony.sh
echo ">> symfony setup";

. /tmp/dwl/keeprunning.sh
