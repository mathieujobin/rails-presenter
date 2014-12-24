# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_presenter/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-presenter"
  spec.version       = RailsPresenter::VERSION
  spec.authors       = ["Mathieu Jobin"]
  spec.email         = ["mathieu@justbudget.com"]
  spec.summary       = %q{RailsPresenter::Base class}
  spec.description   = %q{it should ease the pain of creating a presenter that requires to access Rails helper methods}
  spec.homepage      = "https://github.com/somekool/rails-presenter"
  spec.licenses       = ["GPLv3","MIT"]

  spec.files         = `git ls-files -z lib`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", "4.1.8"
  spec.add_development_dependency "rspec-rails", '~> 2.99'
  spec.add_development_dependency "sqlite3", '~> 1.3'
end
