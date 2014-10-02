require 'spec_helper'

describe 'ssl::incommon', :type => :define do
  let :title do
    'www.example.com'
  end

  it { should contain_ssl__incommon('www.example.com') }

  context 'with no id passed' do
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

  context 'with an id passed' do
    let(:params) {{ :id => '12345' }}

    it do
      should \
        contain_exec('get-cert-www.example.com').
        with({
          'require' => 'File[/usr/local/sbin/check-incommon-cert]',
        })

      should contain_exec('get-int-www.example.com')
    end
  end
end
