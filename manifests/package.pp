# == Class: ssl::package
#
# Installs the necessary packages for the SSL class to function properly
#
class ssl::package(
  $package = 'openssl',
) {
  ensure_packages( flatten([ $package ]) )
}
