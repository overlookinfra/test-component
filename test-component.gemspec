# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'test/component/version'

Gem::Specification.new do |s|
  s.name        = 'test-component'
  s.version     = Test::Component::Version::NUMBER
  s.date        = '2016-01-11'
  s.authors     = ['Puppet Eng Services Team']
  s.email       = ['dev-team@puppetlabs.com']
  s.homepage    = 'https://github.com/justinstoller/test-component'
  s.summary     = 'Test Component for testing Vanagon Pipelines'
  s.description = 'Test Component for testing Vanagon Pipelines'
  s.license     = 'Apache2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end

