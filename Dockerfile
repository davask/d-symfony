FROM davask/d-php:7.0-a2.4-u16.04
MAINTAINER davask <admin@davaskweblimited.com>
LABEL dwl.app.framework="symfony"

COPY ./tmp/dwl/symfony.sh /tmp/dwl/symfony.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
