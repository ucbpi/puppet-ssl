require 'spec_helper'

describe 'ssl::package', :type => :class do
  let :rhel_facts do
    {
      :osfamily => 'RedHat',
    }
  end

  let :debian_facts do
    {
      :osfamily => 'Debian',
    }
  end

  let :arch_facts do
    {
      :osfamily => 'Archlinux',
    }
  end

  #
  # RHEL Specific Tests
  #
  context 'RedHat Specific Tests' do
    context 'openssl package installation' do
      let(:facts) { rhel_facts }
      it do
        should contain_package('openssl').with_ensure('present')
      end
    end
  end

  #
  # Debian Specific Tests
  #
  context 'Debian Specific Tests' do
    context 'openssl package installation' do
      let(:facts) { debian_facts }
      it do
        should contain_package('openssl').with_ensure('present')
      end
    end
  end

  #
  # ArchLinux Specific Tests
  #
  context 'Arch Specific Tests' do
    context 'openssl package installation' do
      let(:facts) { arch_facts }
      it do
        should contain_package('openssl').with_ensure('present')
      end
    end
  end
end
