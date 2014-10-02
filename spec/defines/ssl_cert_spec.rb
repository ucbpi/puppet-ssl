require 'spec_helper'

describe 'ssl::cert', :type => :define do
  let :rhel_facts do
    {
      :osfamily => 'RedHat',
    }
  end

  let :title do
    'www.example.com'
  end

  let :facts do
    rhel_facts
  end

  context 'check for resources' do
    it do
      should contain_exec("generate-key-#{title}")
      #should contain_exec
    end
  end

  context 'with passed parameters' do
    let :facts do
      rhel_facts
    end

    let :params do
      {
        :state => 'New Jersey',
        :city => 'New Brunswick',
        :org => 'Example Org',
        :org_unit => 'Example Org Unit',
        :country => 'US',
      }
    end

    it do
      should contain_exec('generate-key-www.example.com')
    end
  end

  context 'with default parameters' do
    let :facts do
      rhel_facts
    end

    it do
      should contain_exec('generate-key-www.example.com')
    end
  end
end
