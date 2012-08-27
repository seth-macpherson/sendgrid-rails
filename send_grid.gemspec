# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "send_grid/version"

Gem::Specification.new do |s|
  s.name        = "sendgrid-rails"
  s.version     = SendGrid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["PavelTyk","seth-macpherson"]
  s.email       = ["paveltyk@gmail.com","seth.macpherson@gmail.com"]
  s.homepage    = "https://github.com/seth-macpherson/sendgrid-rails"
  s.summary     = %q{SendGrid gem fo Rails 3 (forked from PavelTyk)}
  s.description = %q{Gem to extend ActionMailer with SendGrid API support.  Now includes SMTP credential support.}

  s.rubyforge_project = "sendgrid-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec", "~> 2.5.0"
  s.add_dependency "actionmailer", ">= 3.0.0"
  s.add_dependency "activesupport", ">= 2.1.0"
end

