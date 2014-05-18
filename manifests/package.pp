# == Class: ssl::package
# Installs the necessary packages for the SSL class to function properly
class ssl::package inherits ssl::params {
  ensure_packages( flatten([ $::ssl::params::package ]) )
}
