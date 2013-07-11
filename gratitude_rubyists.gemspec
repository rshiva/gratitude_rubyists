# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gratitude_rubyists/version'

Gem::Specification.new do |gem|
  gem.name          = "gratitude_rubyists"
  gem.version       = GratitudeRubyists::VERSION
  gem.authors       = ["shiva"]
  gem.email         = ["nadarshiva.r@gmail.com"]
  gem.description   = %q{Sending Gratitude Mail to the rubyists}
  gem.summary       = %q{Simple gem for sending Gratitude mail to the list rubyists who's gem your using in your application }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'actionmailer',"~> 4.0.0" 
  gem.add_development_dependency 'rspec'
end
