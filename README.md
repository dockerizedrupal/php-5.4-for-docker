# docker-php-5.4.31

## Run the container

    CONTAINER=php54 && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 9000:9000 \
      --link mailcatcher:ssmtp \
      -v /var/www:/var/www \
      -d \
      simpledrupalcloud/php:5.4.31

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-php.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.4.31 \
      && sudo docker build -t simpledrupalcloud/php:5.4.31 . \
      && cd -

## Apache directives

    <IfModule mod_fastcgi.c>
      AddHandler php .php

      Alias /php54 /var/www/php54
      FastCgiExternalServer /var/www/php54 -host 127.0.0.1:9000 -idle-timeout 300 -pass-header Authorization

      <Location /php54>
        Order deny,allow
        Deny from all
        Allow from env=REDIRECT_STATUS
      </Location>

      Action php /php54
    </IfModule>
