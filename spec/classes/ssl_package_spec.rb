require 'spec_helper'

describe 'ssl::package', :type => :class do
  # this will be evaluated prior to each it block within the following contexts
  before(:each) do
    'include ::ssl::params'
  end

  # RedHat, ArchLinux and Debian all call the package openssl
  [ "RedHat", "ArchLinux", "Debian" ].each do |fam|
    context "on #{fam} based systems" do
      let(:facts) { { :osfamily => fam } }

      it do
        should contain_package('openssl')
      end
    end
  end
end
