class run::php54 {
  file { '/usr/local/src/phpfarm/inst/current/etc/pool.d/www.conf':
    ensure => present,
    content => template('run/www.conf.erb'),
    mode => 644
  }

  include run::php54::ini::realpath_cache_size
  include run::php54::ini::realpath_cache_ttl
  include run::php54::ini::timezone
  include run::php54::ini::post_max_size
  include run::php54::ini::upload_max_filesize
  include run::php54::ini::short_open_tag
  include run::php54::ini::max_execution_time
  include run::php54::ini::max_input_vars
  include run::php54::ini::memory_limit
  include run::php54::ini::display_errors
  include run::php54::ini::display_startup_errors
  include run::php54::ini::error_reporting
  include run::php54::ini::expose_php
  include run::php54::ini::allow_url_fopen

  if $php_ini_opcache == "On" {
    include run::php54::ini::opcache
  }

  if $php_ini_xdebug == "On" {
    include run::php54::ini::xdebug
  }

  if $php_ini_memcached == "On" {
    include run::php54::ini::memcached
  }

  if $php_ini_redis == "On" {
    include run::php54::ini::redis
  }

  if $php_ini_blackfire == "On" and $php_ini_blackfire_server_id and $php_ini_blackfire_server_token {
    include run::php54::ini::blackfire
  }

  if $php_ini_apcu == "On" {
    include run::php54::ini::apcu
  }

  if $php_ini_apd == "On" {
    include run::php54::ini::apd
  }
}
