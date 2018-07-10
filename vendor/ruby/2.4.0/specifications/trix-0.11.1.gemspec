# -*- encoding: utf-8 -*-
# stub: trix 0.11.1 ruby lib

Gem::Specification.new do |s|
  s.name = "trix".freeze
  s.version = "0.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jon Moss".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-12-17"
  s.description = "A rich text editor for everyday writing".freeze
  s.email = "me@jonathanmoss.me".freeze
  s.homepage = "https://github.com/maclover7/trix".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "A rich text editor for everyday writing".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, ["< 5.2", "> 4.1"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<formtastic>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<simple_form>.freeze, ["~> 3.5"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-activemodel-mocks>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.35.1"])
    else
      s.add_dependency(%q<rails>.freeze, ["< 5.2", "> 4.1"])
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<formtastic>.freeze, ["~> 3.0"])
      s.add_dependency(%q<simple_form>.freeze, ["~> 3.5"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-activemodel-mocks>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.35.1"])
    end
  else
    s.add_dependency(%q<rails>.freeze, ["< 5.2", "> 4.1"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<formtastic>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simple_form>.freeze, ["~> 3.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-activemodel-mocks>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.35.1"])
  end
end
