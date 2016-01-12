# vim:filetype=ruby

source ENV['GEM_SOURCE'] || 'https://rubygems.org'

# Helper method to override Puppet Labs projects for testing purposes
def location_for(place, fake_version = nil)
  if place =~ /^(git[:@][^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false }]
  else
    [place, { :require => false }]
  end
end

# Pull in any gems defined in the gemspec
gemspec

# development, unit, and integration testing requirements
group(:development, :test) do
  gem 'rspec', '~> 3.1', :require => false
  gem 'yarjuf', '~> 2.0'
  gem 'rake', '~> 10.0'
  gem 'rubocop', '~> 0.26.1', :platforms => [:ruby]
  gem 'pry'
end

group(:packaging) do
  gem 'packaging', :github => 'puppetlabs/packaging'
  gem 'vanagon', *location_for(ENV['VANAGON_LOCATION'] || '~> 0.5.0')
end

group(:system_tests) do
  gem 'beaker', *location_for(ENV['BEAKER_LOCATION'] || '~> 2.0')
  gem 'beaker-rspec', *location_for(ENV['BEAKER_RSPEC_LOCATION'] || '~> 5.0')
end

group(:docs) do
  gem 'markdown'
  gem 'yard'
  gem 'thin'
end
# Pulls in any local settings for personal development from a Gemfile.local
if File.exists? '#{__FILE__}.local'
  eval(File.read('#{__FILE__}.local'), binding)
end

