class php {
  require php::packages
  require php::phpfarm
  require php::supervisor
  require php::freetds

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-5.4.42/etc/conf.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-5.4.42/lib/php/extensions/no-debug-non-zts-20100525': }

  file { '/tmp/php-5.4.42.tar.gz':
    ensure => present,
    source => 'puppet:///modules/php/tmp/php-5.4.42.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf php-5.4.42.tar.gz':
    require => File['/tmp/php-5.4.42.tar.gz']
  }

  bash_exec { 'mv /tmp/php-5.4.42 /usr/local/src/phpfarm/src/php-5.4.42':
    require => Bash_exec['cd /tmp && tar xzf php-5.4.42.tar.gz']
  }

  file { '/usr/local/src/phpfarm/src/custom/options-5.4.42.sh':
    ensure => present,
    source => 'puppet:///modules/php/usr/local/src/phpfarm/src/custom/options-5.4.42.sh',
    mode => 755,
    require => Bash_exec['mv /tmp/php-5.4.42 /usr/local/src/phpfarm/src/php-5.4.42']
  }

  bash_exec { '/usr/local/src/phpfarm/src/main.sh 5.4.42':
    timeout => 0,
    require => File['/usr/local/src/phpfarm/src/custom/options-5.4.42.sh']
  }

  bash_exec { 'rm -rf /usr/local/src/phpfarm/src/php-5.4.42':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 5.4.42']
  }

  file { '/usr/local/src/phpfarm/inst/php-5.4.42/etc/php-fpm.conf':
    ensure => present,
    source => 'puppet:///modules/php/usr/local/src/phpfarm/inst/php-5.4.42/etc/php-fpm.conf',
    mode => 644,
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 5.4.42']
  }

  bash_exec { 'switch-phpfarm 5.4.42':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 5.4.42']
  }
}