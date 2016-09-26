FROM davask/d-php:5.6-a2.4-u14.04
MAINTAINER davask <admin@davaskweblimited.com>
LABEL dwl.app.framework="symfony"

RUN /bin/bash -c 'apt-get update'
RUN /bin/bash -c 'apt-get install -y php-mysql'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'

COPY ./tmp/dwl/symfony.sh /tmp/dwl/symfony.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
