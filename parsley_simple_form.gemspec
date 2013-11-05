$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "parsley_simple_form/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "parsley_simple_form"
  s.version     = ParsleySimpleForm::VERSION
  s.authors     = ['Guilherme Moretti']
  s.email       = ['guilherme.moretti@innvent.com.br']
  s.homepage    = "http://github.com/innvent/parsley_simple_form"
  s.summary     = "Client side validation with parsley and simple_form."
  s.description = "Client side validation with parsley and simple_form."
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "simple_form"
  s.add_dependency "parsley-rails"

  s.add_development_dependency "sqlite3"
end
