class build::php54::extensions {
  require build::php54

  include build::php54::extension::xdebug
  include build::php54::extension::memcached
  include build::php54::extension::redis
  include build::php54::extension::blackfire
  include build::php54::extension::apcu
  include build::php54::extension::zendopcache
  include build::php54::extension::apd
}
