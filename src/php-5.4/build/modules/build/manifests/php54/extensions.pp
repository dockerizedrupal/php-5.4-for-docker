class build::php54::extensions {
  require build::php54

  include build::php54::extensions::xdebug
  include build::php54::extensions::memcached
  include build::php54::extensions::redis
  include build::php54::extensions::blackfire
  include build::php54::extensions::apcu
  include build::php54::extensions::zendopcache
  include build::php54::extensions::apd
}
