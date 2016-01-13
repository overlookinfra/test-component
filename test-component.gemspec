# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'test/component/version'

module Helper
  def self.get_files(glob = '**/**')
    ignore_globs = File.read('.gitignore').each_line.map{|p| p.chomp}
    ignored = ignore_globs.map{|p| Dir[p] }.flatten.uniq.compact
    all = Dir[glob]

    all - ignored
  end
end

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

  s.files         = Helper.get_files
  s.test_files    = Helper.get_files('{test,spec,features}/*')
  s.executables   = Helper.get_files('bin/*').map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end

