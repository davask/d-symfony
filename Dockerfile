FROM davask/d-php:7.0-a2.4-u16.04
MAINTAINER davask <admin@davaskweblimited.com>
LABEL dwl.app.framework="symfony"

RUN /bin/bash -c 'curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony'
RUN /bin/bash -c 'chmod a+x /usr/local/bin/symfony'
RUN /bin/bash -c 'symfony new symfony'
RUN /bin/bash -c 'mv symfony /tmp/dwl'

RUN /bin/bash -c 'echo "chown -R \$\{DWL_USER_NAME\}:\$\{DWL_USER_NAME\} /tmp/dwl/symfony.sh;" >> /tmp/dwl/permission.sh'

COPY ./tmp/dwl/source.sh /tmp/dwl/source.sh
COPY ./tmp/dwl/symfony.sh /tmp/dwl/symfony.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
