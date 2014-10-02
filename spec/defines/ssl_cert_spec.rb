require 'spec_helper'

describe 'ssl::cert', :type => :define do
  let(:title) { 'www.example.com' }

  let(:cnf_file_params){{
    :ensure => 'file',
    :owner => 'root',
    :group => 'root',
    :mode => '0440',
    :before => 'Exec[generate-key-www.example.com]',
    :notify => 'Exec[generate-csr-www.example.com]',
  }}

  let(:key_file_params) {{
    :ensure => 'present',
    :mode => '0600',
    :owner => 'root',
    :group => 'root',
    :require => 'Exec[generate-key-www.example.com]',
  }}

  it do
    [ 'csr','csrh','self','key'].each do |type|
      should contain_exec("generate-#{type}-#{title}")
    end

    should contain_ssl__cert('www.example.com')

    should \
      contain_file("/etc/pki/tls/certs/meta/www.example.com.cnf").
      with(cnf_file_params)

    should \
      contain_file("/etc/pki/tls/private/www.example.com.key").
      with(key_file_params)
  end
end
