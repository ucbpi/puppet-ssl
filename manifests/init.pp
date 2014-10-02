# == Class: ssl
#
# ensures the required packages are installed and that our metadata directory
# is created
#
class ssl(
  $package = $::ssl::package,
) inherits ssl::params {
  class { 'ssl::package': package => $package }

  file { "${::ssl::params::crt_dir}/meta":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }
}
