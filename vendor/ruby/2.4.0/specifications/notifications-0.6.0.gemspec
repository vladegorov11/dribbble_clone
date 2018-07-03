# -*- encoding: utf-8 -*-
# stub: notifications 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "notifications".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jason Lee".freeze]
  s.date = "2018-03-06"
  s.description = "Rails mountable Notification for any applications.".freeze
  s.email = ["huacnlee@gmail.com".freeze]
  s.homepage = "https://github.com/rails-engine/notifications".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Rails mountable Notification for any applications.".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, ["~> 5"])
      s.add_runtime_dependency(%q<kaminari>.freeze, [">= 0.15"])
    else
      s.add_dependency(%q<rails>.freeze, ["~> 5"])
      s.add_dependency(%q<kaminari>.freeze, [">= 0.15"])
    end
  else
    s.add_dependency(%q<rails>.freeze, ["~> 5"])
    s.add_dependency(%q<kaminari>.freeze, [">= 0.15"])
  end
end
