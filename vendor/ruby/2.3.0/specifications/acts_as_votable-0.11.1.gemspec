# -*- encoding: utf-8 -*-
# stub: acts_as_votable 0.11.1 ruby lib

Gem::Specification.new do |s|
  s.name = "acts_as_votable"
  s.version = "0.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ryan"]
  s.date = "2017-10-17"
  s.description = "Rails gem to allowing records to be votable"
  s.email = ["ryanto"]
  s.homepage = "http://rubygems.org/gems/acts_as_votable"
  s.licenses = ["MIT"]
  s.rubyforge_project = "acts_as_votable"
  s.rubygems_version = "2.5.2.1"
  s.summary = "Rails gem to allowing records to be votable"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.6"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.49.1"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.15.0"])
      s.add_development_dependency(%q<appraisal>, ["~> 2.2"])
      s.add_development_dependency(%q<factory_girl>, ["~> 4.8"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.6"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_dependency(%q<rubocop>, ["~> 0.49.1"])
      s.add_dependency(%q<simplecov>, ["~> 0.15.0"])
      s.add_dependency(%q<appraisal>, ["~> 2.2"])
      s.add_dependency(%q<factory_girl>, ["~> 4.8"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.6"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    s.add_dependency(%q<rubocop>, ["~> 0.49.1"])
    s.add_dependency(%q<simplecov>, ["~> 0.15.0"])
    s.add_dependency(%q<appraisal>, ["~> 2.2"])
    s.add_dependency(%q<factory_girl>, ["~> 4.8"])
  end
end
