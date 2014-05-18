require 'spec_helper'

describe 'ssl', :type => :class do
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

  let :meta_dir_params do
    {
      :ensure => 'directory',
      :owner => 'root',
      :group => 'root',
      :mode => '0444',
    }
  end
  
  #
  # OS-Independant Tests
  #
  # We'll use the rhel_facts, otherwise without a support osfamily fact we'll
  # get a puppet parse error.
  #
  context 'include our packages class' do
    let(:facts) { rhel_facts }
    it do
      should contain_ssl__package
    end
  end

  #
  # RHEL Specific Tests
  #
  context 'RedHat Specific Tests' do
    context 'create our meta directory' do
      let(:facts) { rhel_facts }
      it do
        should contain_file('/etc/pki/tls/certs/meta').with(meta_dir_params)
      end
    end
  end

  #
  # Debian Specific Tests
  #
  context 'Debian Specific Tests' do
    context 'create our meta directory' do
      let(:facts) { debian_facts }
      it do
        should contain_file('/etc/ssl/certs/meta').with(meta_dir_params)
      end
    end
  end

  #
  # ArchLinux Specific Tests
  #
  context 'Arch Specific Tests' do
    context 'create our meta directory' do
      let(:facts) { arch_facts }
      it do
        should contain_file('/etc/ssl/certs/meta').with(meta_dir_params)
      end
    end
  end
end
