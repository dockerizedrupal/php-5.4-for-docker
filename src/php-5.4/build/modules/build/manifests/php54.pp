class build::php54 {
  require build::php54::packages
  require build::php54::supervisor
  require build::phpfarm
  require build::freetds

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-5.4.45/etc/conf.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-5.4.45/etc/fpm.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-5.4.45/etc/pool.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-5.4.45/lib/php/extensions/no-debug-non-zts-20100525': }

  file { '/tmp/php-5.4.45.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php-5.4.45.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf php-5.4.45.tar.gz':
    require => File['/tmp/php-5.4.45.tar.gz']
  }

  bash_exec { 'mv /tmp/php-5.4.45 /usr/local/src/phpfarm/src/php-5.4.45':
    require => Bash_exec['cd /tmp && tar xzf php-5.4.45.tar.gz']
  }

  file { '/usr/local/src/phpfarm/src/custom/options-5.4.45.sh':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/src/custom/options-5.4.45.sh',
    mode => 755,
    require => Bash_exec['mv /tmp/php-5.4.45 /usr/local/src/phpfarm/src/php-5.4.45']
  }

  bash_exec { '/usr/local/src/phpfarm/src/main.sh 5.4.45':
    timeout => 0,
    require => File['/usr/local/src/phpfarm/src/custom/options-5.4.45.sh']
  }

  bash_exec { 'rm -rf /usr/local/src/phpfarm/src/php-5.4.45':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 5.4.45']
  }

  file { '/usr/local/src/phpfarm/inst/php-5.4.45/etc/php-fpm.conf':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/inst/php-5.4.45/etc/php-fpm.conf',
    mode => 644,
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 5.4.45']
  }

  bash_exec { 'switch-phpfarm 5.4.45':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 5.4.45']
  }
}
