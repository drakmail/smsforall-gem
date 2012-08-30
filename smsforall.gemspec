# -*- encoding: utf-8 -*-
require File.expand_path('../lib/smsforall/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["drakmail"]
  gem.email         = ["drakmail@delta.pm"]
  gem.description   = %q{Interaction with smsforall.ru API}
  gem.summary       = %q{Sending SMS with smsforall.ru API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "smsforall"
  gem.require_paths = ["lib"]
  gem.version       = Smsforall::VERSION

  gem.add_dependency 'json'

  gem.add_development_dependency 'rspec'
end
