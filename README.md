docker-php-5.4.31
=================

Run the container
-----------------

    CONTAINER=php5431 && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 5431:5431
      -v /var/www:/var/www \
      -d \
      simpledrupalcloud/php:5.4.31

Build the image
---------------

    TMP=$(mktemp -d) \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-php.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.4.31 \
      && sudo docker build -t simpledrupalcloud/php:5.4.31 . \
      && cd -