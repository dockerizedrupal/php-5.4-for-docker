class build::php54::extensions::zend_debugger {
  require build::php54

  file { '/usr/local/src/phpfarm/inst/php-5.4.45/lib/php/extensions/no-debug-non-zts-20100525/ZendDebugger.so':
    ensure => present,
    source => 'puppet:///modules/build/tmp/ZendDebugger.so'
  }
}
