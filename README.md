# docker-php-5.4

A Docker image for [PHP](http://php.net/) version 5.4 that runs PHP in FPM (FastCGI Process Manager) mode.

This project is part of the [Dockerized Drupal](https://dockerizedrupal.com/) initiative.

## Run the container

    CONTAINER="php" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 9000:9000 \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e DRUPAL_VERSION="7" \
      -e DRUSH_VERSION="7" \
      -e SMTP_HOST="" \
      -e SMTP_PORT="25" \
      -e MYSQL_HOST="" \
      -e MYSQL_PORT="3306" \
      -e MEMCACHED_HOST="" \
      -e MEMCACHED_PORT="11211" \
      -e REDIS_HOST="" \
      -e REDIS_PORT="6379" \
      -e PHP_INI_REALPATH_CACHE_SIZE="256k" \
      -e PHP_INI_REALPATH_CACHE_TTL="3600" \
      -e PHP_INI_POST_MAX_SIZE="512M" \
      -e PHP_INI_TIMEZONE="UTC" \
      -e PHP_INI_UPLOAD_MAX_FILESIZE="512M" \
      -e PHP_INI_SHORT_OPEN_TAG="On" \
      -e PHP_INI_MAX_EXECUTION_TIME="300" \
      -e PHP_INI_MAX_INPUT_VARS="4096" \
      -e PHP_INI_MEMORY_LIMIT="512M" \
      -e PHP_INI_DISPLAY_ERRORS="On" \
      -e PHP_INI_DISPLAY_STARTUP_ERRORS="On" \
      -e PHP_INI_ERROR_REPORTING="E_ALL" \
      -e PHP_INI_EXPOSE_PHP="On" \
      -e PHP_INI_ALLOW_URL_FOPEN="On" \
      -e PHP_INI_OPCACHE="On" \
      -e PHP_INI_OPCACHE_MEMORY_CONSUMPTION="2048" \
      -e PHP_INI_XDEBUG="On" \
      -e PHP_INI_XDEBUG_REMOTE_PORT="9000" \
      -e PHP_INI_XDEBUG_REMOTE_HOST="127.0.0.1" \
      -e PHP_INI_XDEBUG_REMOTE_CONNECT_BACK="On" \
      -e PHP_INI_XDEBUG_IDEKEY="PHPSTORM" \
      -e PHP_INI_XDEBUG_VAR_DISPLAY_MAX_DEPTH="3" \
      -e PHP_INI_MEMCACHED="On" \
      -e PHP_INI_REDIS="On" \
      -e PHP_INI_BLACKFIRE="On" \
      -e PHP_INI_BLACKFIRE_SERVER_ID="" \
      -e PHP_INI_BLACKFIRE_SERVER_TOKEN="" \
      -e PHP_INI_APCU="On" \
      -e PHP_INI_APD="On" \
      -e PHP_FPM_PM="dynamic" \
      -e PHP_FPM_PM_MAX_CHILDREN="5" \
      -e PHP_FPM_PM_START_SERVERS="2" \
      -e PHP_FPM_PM_MIN_SPARE_SERVERS="1" \
      -e PHP_FPM_PM_MAX_SPARE_SERVERS="3" \
      -e PHP_FPM_PM_PROCESS_IDLE_TIMEOUT="10s" \
      -e PHP_FPM_PM_MAX_REQUESTS="0" \
      -e FREETDS_1_SERVER_NAME="" \
      -e FREETDS_1_HOST="" \
      -e FREETDS_1_PORT="1433" \
      -e FREETDS_1_TDS_VERSION="8.0" \
      -e FREETDS_1_CLIENT_CHARSET="UTF-8" \
      -e CRONTAB_1_MAILTO="" \
      -e CRONTAB_1_EXPRESSION="" \
      -e CRONTAB_1_COMMAND="" \
      -e USER_ID="" \
      -e GROUP_ID="" \
      -d \
      dockerizedrupal/php-5.4:1.2.1

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-php-5.4.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.2.1 \
      && sudo docker build -t dockerizedrupal/php-5.4:1.2.1 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## Tests

Tests are implemented in [Bats: Bash Automated Testing System](https://github.com/sstephenson/bats).

### Test results for the current release

    1..80
    ok 1 php-5.4
    ok 2 php-5.4: drupal 7
    ok 3 php-5.4: drupal 7: drush 5
    ok 4 php-5.4: drupal 7: phpcs
    ok 5 php-5.4: drupal 7: phpcs: phpcompatibility
    ok 6 php-5.4: drupal 7: phpcs: drupal
    ok 7 php-5.4: drupal 7
    ok 8 php-5.4: drupal 7: drush 6
    ok 9 php-5.4: drupal 7: phpcs
    ok 10 php-5.4: drupal 7: phpcs: phpcompatibility
    ok 11 php-5.4: drupal 7: phpcs: drupal
    ok 12 php-5.4: drupal 7
    ok 13 php-5.4: drupal 7: drush 7
    ok 14 php-5.4: drupal 7: phpcs
    ok 15 php-5.4: drupal 7: phpcs: phpcompatibility
    ok 16 php-5.4: drupal 7: phpcs: drupal
    ok 17 php-5.4: fpm: pm
    ok 18 php-5.4: fpm: pm.max_children
    ok 19 php-5.4: fpm: pm.max_requests
    ok 20 php-5.4: fpm: pm.max_spare_servers
    ok 21 php-5.4: fpm: pm.min_spare_servers
    ok 22 php-5.4: fpm: pm.process_idle_timeout
    ok 23 php-5.4: fpm: pm.start_servers
    ok 24 php-5.4: freetds: FREETDS_1_SERVER_NAME
    ok 25 php-5.4: freetds: FREETDS_1_HOST
    ok 26 php-5.4: freetds: FREETDS_1_PORT
    ok 27 php-5.4: freetds: FREETDS_1_TDS_VERSION
    ok 28 php-5.4: freetds: FREETDS_2_SERVER_NAME
    ok 29 php-5.4: freetds: FREETDS_2_HOST
    ok 30 php-5.4: freetds: FREETDS_2_PORT
    ok 31 php-5.4: freetds: FREETDS_2_TDS_VERSION
    ok 32 php-5.4: freetds: FREETDS_3_SERVER_NAME
    ok 33 php-5.4: freetds: FREETDS_3_HOST
    ok 34 php-5.4: freetds: FREETDS_3_PORT
    ok 35 php-5.4: freetds: FREETDS_3_TDS_VERSION
    ok 36 php-5.4: ini: allow_url_fopen: off
    ok 37 php-5.4: ini: allow_url_fopen: on
    ok 38 php-5.4: ini: apcu: off
    ok 39 php-5.4: ini: apcu: on
    ok 40 php-5.4: ini: apd: off
    ok 41 php-5.4: ini: apd: on
    ok 42 php-5.4: ini: blackfire: off
    ok 43 php-5.4: ini: blackfire: on
    ok 44 php-5.4: ini: blackfire.server_id
    ok 45 php-5.4: ini: blackfire.server_token
    ok 46 php-5.4: ini: display_errors: off
    ok 47 php-5.4: ini: display_errors: on
    ok 48 php-5.4: ini: display_startup_errors: off
    ok 49 php-5.4: ini: display_startup_errors: on
    ok 50 php-5.4: ini: error_reporting
    ok 51 php-5.4: ini: expose_php: off
    ok 52 php-5.4: ini: expose_php: on
    ok 53 php-5.4: ini: igbinary: on
    ok 54 php-5.4: ini: max_execution_time
    ok 55 php-5.4: ini: max_input_vars
    ok 56 php-5.4: ini: memcached: off
    ok 57 php-5.4: ini: memcached: on
    ok 58 php-5.4: ini: memory_limit
    ok 59 php-5.4: ini: mssql: on
    ok 60 php-5.4: ini: opcache.memory_consumption
    ok 61 php-5.4: ini: opcache: off
    ok 62 php-5.4: ini: opcache: on
    ok 63 php-5.4: ini: post_max_size
    ok 64 php-5.4: ini: realpath_cache_size
    ok 65 php-5.4: ini: realpath_cache_ttl
    ok 66 php-5.4: ini: redis: off
    ok 67 php-5.4: ini: redis: on
    ok 68 php-5.4: ini: short_open_tag: off
    ok 69 php-5.4: ini: short_open_tag: on
    ok 70 php-5.4: ini: timezone
    ok 71 php-5.4: ini: upload_max_filesize
    ok 72 php-5.4: ini: xdebug.idekey
    ok 73 php-5.4: ini: xdebug: off
    ok 74 php-5.4: ini: xdebug: on
    ok 75 php-5.4: ini: xdebug.remote_connect_back: off
    ok 76 php-5.4: ini: xdebug.remote_connect_back: on
    ok 77 php-5.4: ini: xdebug.remote_host
    ok 78 php-5.4: ini: xdebug.remote_port
    ok 79 php-5.4: smtp: off
    ok 80 php-5.4: smtp: on

## License

**MIT**
