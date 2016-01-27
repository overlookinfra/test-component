require 'beaker-rspec/spec_helper'

RSpec.configure do |rspec|
  rspec.before(:suite) do
    BUILD_SERVER      = ENV['BUILD_SERVER'] || 'http://builds.delivery.puppetlabs.net'
    BUILD_VERSION     = ENV['SHA'] || 'latest'
    PACKAGE_NAME      = 'test-suite'
    LOCAL_WORKSPACE   = 'tmp'

    hosts.each do |host|
      install_repo_configs(host, BUILD_SERVER, PACKAGE_NAME,
                           BUILD_VERSION, LOCAL_WORKSPACE)

      install_package(host, PACKAGE_NAME)
    end
  end
end

