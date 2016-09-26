FROM davask/d-lamp:m5.5-p5.6-a2.4-u14.04
MAINTAINER davask <admin@davaskweblimited.com>
LABEL dwl.app.framework="symfony"

COPY ./tmp/dwl/symfony.sh /tmp/dwl/symfony.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
