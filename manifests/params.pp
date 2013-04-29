# == Class: ssl::params
# Sets up some params based on OSFamily for the remainder of the module to make
# use of
class ssl::params {
  case $::osfamily {
    'RedHat': {
      $package = 'openssl'
      $crt_dir = '/etc/pki/tls/certs'
      $key_dir = '/etc/pki/tls/private'
    }
    default: {
      fail("\$::osfamily = '${::osfamily}' not supported!")
    }
  }
}
