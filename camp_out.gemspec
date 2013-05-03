require File.expand_path('../lib/camp_out/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'faraday', '~> 0.8.0'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_dependency 'hashie', '~> 1.2'
  gem.add_dependency 'multi_xml'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.name = 'camp_out'
  gem.description = %q{Ruby wrapper for active.com Campground API}
  gem.summary = gem.description
  gem.authors = ['Brian DeHamer']
  gem.email = ['brian@dehamer.com']
  gem.homepage = 'http://github.com/bdehamer/camp_out'
  gem.require_paths = ['lib']
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.platform = Gem::Platform::RUBY
  gem.version = CampOut::VERSION.dup
end
