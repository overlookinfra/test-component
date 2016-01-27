require 'acceptance_helper'

describe 'our little test component' do
  describe command('/opt/puppetlabs/test/bin/test-component') do
    its(:stdout) { should match /Hello/ }
  end
end
