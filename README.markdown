# SSL Management Module #

This module provides a standard way to manage your SSL certificates, and
currently includes support for auto-downloading your signed certs from InCommon.

Support for this module is currently limited to Red Hat, though contributions
are encouraged, especially for Debian support.

## Dependencies ##

* puppetlabs-stdlib >= 2.6.0 (may work with earlier versions)


## Example ##

<pre><code>
  include ssl
  
  ssl::cert { 'www.example.com':
    alt_names => [ 'www2.example.com' ],
    country   => 'US',
    org       => 'Example.com, LLC',
    org_unit  => 'Web Team',
    state     => 'CA',
  }

  # once we receive our email confirmation with out cert#, we can enter it into
  # the id field, and it will automatically be downloaded if necessary.
  ssl::incommon { 'www.example.com': id => '12345' }
</code></pre>

License
-------

None

Contact
-------

Aaron Russo <arusso@berkeley.edu>

Support
-------

Please log tickets and issues at the
[Projects site](https://github.com/arusso/puppet-ssl/issues/)
