require 'spec_helper'

describe 'ssl', :type => :class do
  it do
    should contain_class('ssl::package').with_package('openssl')
  end

  let :file_meta_params do
    {
      :ensure => 'directory',
      :owner => 'root',
      :group => 'root',
      :mode => '0444',
    }
  end

  context 'on RedHat-family based systems' do
    let(:facts){{ :osfamily => 'RedHat' }}

    it do
      should \
        contain_file('/etc/pki/tls/certs/meta').
        with(file_meta_params)
    end
  end

  context 'on Debian-family based systems' do
    let(:facts) {{ :osfamily => 'Debian' }}

    it do
      should \
        contain_file('/etc/ssl/certs/meta').
        with(file_meta_params)
    end
  end

  context 'on ArchLinux-family based systems' do
    let(:facts) {{ :osfamily => 'ArchLinux' }}

    it do
      should \
        contain_file('/etc/ssl/certs/meta').
        with(file_meta_params)
    end
  end
end
