class build::php54::supervisor {
  file { '/etc/supervisor/conf.d/php-5.4.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/php-5.4.conf',
    mode => 644
  }
}
