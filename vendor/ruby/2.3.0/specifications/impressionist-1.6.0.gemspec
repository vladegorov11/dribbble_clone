# -*- encoding: utf-8 -*-
# stub: impressionist 1.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "impressionist"
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["johnmcaliley"]
  s.date = "2017-05-24"
  s.description = "Log impressions from controller actions or from a model"
  s.email = "john.mcaliley@gmail.com"
  s.homepage = "http://github.com/charlotte-ruby/impressionist"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "Easy way to log impressions"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
  end
end
