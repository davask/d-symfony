FROM davask/d-php:7.0-a2.4-u16.04
MAINTAINER davask <admin@davaskweblimited.com>
LABEL dwl.app.framework="symfony"

RUN /bin/bash -c 'curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony'
RUN /bin/bash -c 'chmod a+x /usr/local/bin/symfony'
RUN /bin/bash -c 'symfony new symfony 2.8'
RUN /bin/bash -c 'mv symfony /tmp/dwl'

COPY ./tmp/dwl/symfony.sh /tmp/dwl/symfony.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
