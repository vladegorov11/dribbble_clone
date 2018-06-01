# -*- encoding: utf-8 -*-
# stub: fog-ovirt 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-ovirt".freeze
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ori Rabin".freeze]
  s.date = "2018-04-11"
  s.description = "This library can be used as a module for `fog`.".freeze
  s.email = ["orabin@redhat.com".freeze]
  s.homepage = "https://github.com/fog/fog-ovirt".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Module for the 'fog' gem to support Ovirt.".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fog-core>.freeze, ["~> 1.45"])
      s.add_runtime_dependency(%q<fog-json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<fog-xml>.freeze, ["~> 0.1.1"])
      s.add_runtime_dependency(%q<ovirt-engine-sdk>.freeze, [">= 4.1.3"])
      s.add_runtime_dependency(%q<rbovirt>.freeze, ["~> 0.1.5"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.52"])
      s.add_development_dependency(%q<shindo>.freeze, ["~> 0.3"])
    else
      s.add_dependency(%q<fog-core>.freeze, ["~> 1.45"])
      s.add_dependency(%q<fog-json>.freeze, [">= 0"])
      s.add_dependency(%q<fog-xml>.freeze, ["~> 0.1.1"])
      s.add_dependency(%q<ovirt-engine-sdk>.freeze, [">= 4.1.3"])
      s.add_dependency(%q<rbovirt>.freeze, ["~> 0.1.5"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.52"])
      s.add_dependency(%q<shindo>.freeze, ["~> 0.3"])
    end
  else
    s.add_dependency(%q<fog-core>.freeze, ["~> 1.45"])
    s.add_dependency(%q<fog-json>.freeze, [">= 0"])
    s.add_dependency(%q<fog-xml>.freeze, ["~> 0.1.1"])
    s.add_dependency(%q<ovirt-engine-sdk>.freeze, [">= 4.1.3"])
    s.add_dependency(%q<rbovirt>.freeze, ["~> 0.1.5"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.52"])
    s.add_dependency(%q<shindo>.freeze, ["~> 0.3"])
  end
end
