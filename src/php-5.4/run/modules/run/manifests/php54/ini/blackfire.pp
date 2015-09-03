class run::php54::ini::blackfire {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/blackfire.ini':
    ensure => present,
    content => template('run/php54/ini/blackfire.ini.erb'),
    mode => 644
  }
}
