# == Class: ssl
#
# Class manages openssl installation, and certificate/key/csr generation
class ssl inherits params {
  include ssl::package

  file { "${ssl::params::crt_dir}/meta":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }
}
