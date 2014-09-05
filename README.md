docker-php-5.4.31
=================

Run the container
-----------------

    sudo docker run \
      --name php5431 \
      --net host \
      --volumes-from apache \
      -d \
      simpledrupalcloud/php:5.4.31

Build the image yourself
------------------------

    git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-php.git docker-php
    cd docker-php
    git checkout 5.4.31
    sudo docker build -t php:5.4.31 .