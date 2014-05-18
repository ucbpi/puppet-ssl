require 'spec_helper'

describe 'ssl::incommon', :type => :define do
  # while we use RedHat osfamily, the entirety of this define should be
  # OS independant. We just need to include the osfamily fact to appease
  # the params class which will fail if it's not a supported osfamily
  let :facts do
    {
      :osfamily => 'RedHat',
    }
  end
  let :title do
    'www.example.com'
  end
  context 'no id passed' do
    it do
      should contain_file('/usr/local/sbin/check-incommon-cert').with({
        'ensure' => 'present',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0550',
        'source' => 'puppet:///modules/ssl/check-incommon-cert.sh',
      })

      should_not contain_exec('get-cert-www.example.com')
      should_not contain_exec('get-int-www.example.com')
    end
  end

  context 'id 12345 passed' do
    let :params do
      {
        :id => '12345',
      }
    end
    it do
      should contain_exec('get-cert-www.example.com').with({
        'require' => 'File[/usr/local/sbin/check-incommon-cert]',
      })
      should contain_exec('get-int-www.example.com')
    end
  end
end
