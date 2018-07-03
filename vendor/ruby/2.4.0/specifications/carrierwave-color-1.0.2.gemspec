# -*- encoding: utf-8 -*-
# stub: carrierwave-color 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-color".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sunny Ripert".freeze]
  s.date = "2017-01-09"
  s.description = "Store the dominant color of the images when you upload them to your Rails application using the CarrierWave gem.".freeze
  s.email = ["sunny@sunfox.org".freeze]
  s.homepage = "https://github.com/sunny/carrierwave-color".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Store the dominant color of an image with CarrierWave".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colorscore>.freeze, [">= 0.0.5"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<colorscore>.freeze, [">= 0.0.5"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<colorscore>.freeze, [">= 0.0.5"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
