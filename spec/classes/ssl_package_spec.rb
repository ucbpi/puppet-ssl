require 'spec_helper'

describe 'ssl::package', :type => :class do
  context 'with $package left unset' do
    it do
      should contain_package('openssl')
    end
  end

  context 'with $package = [ "openssl", "libssl" ]' do
    let(:params) {{ 'package' => [ 'openssl','libssl' ] }}

    it do
      should contain_package('openssl')
      should contain_package('libssl')
    end
  end
end
