# -*- encoding: utf-8 -*-
# stub: evil_icons 1.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "evil_icons".freeze
  s.version = "1.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alexander Madyankin".freeze, "Roman Shamin".freeze]
  s.date = "2016-11-18"
  s.description = "Evil Icons is a set of SVG icons designed extensively for using in modern web projects".freeze
  s.email = ["alexander@madyankin.name".freeze]
  s.homepage = "http://evil-icons.io".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Evil Icons is a set of SVG icons for modern web projects".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_development_dependency(%q<uglifier>.freeze, ["~> 2.7.0"])
      s.add_development_dependency(%q<csso-rails>.freeze, ["~> 0.3.4"])
      s.add_development_dependency(%q<therubyracer>.freeze, ["~> 0.12.2"])
    else
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_dependency(%q<uglifier>.freeze, ["~> 2.7.0"])
      s.add_dependency(%q<csso-rails>.freeze, ["~> 0.3.4"])
      s.add_dependency(%q<therubyracer>.freeze, ["~> 0.12.2"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
    s.add_dependency(%q<uglifier>.freeze, ["~> 2.7.0"])
    s.add_dependency(%q<csso-rails>.freeze, ["~> 0.3.4"])
    s.add_dependency(%q<therubyracer>.freeze, ["~> 0.12.2"])
  end
end
