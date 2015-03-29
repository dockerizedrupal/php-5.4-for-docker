class php::extension::zend_debugger {
  require php

  file { '/usr/local/src/phpfarm/inst/php-5.4.33/lib/php/extensions/no-debug-non-zts-20100525/ZendDebugger.so':
    ensure => present,
    source => 'puppet:///modules/php/tmp/ZendDebugger.so'
  }
}
