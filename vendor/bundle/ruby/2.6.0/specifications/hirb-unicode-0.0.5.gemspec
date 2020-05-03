# -*- encoding: utf-8 -*-
# stub: hirb-unicode 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "hirb-unicode".freeze
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["miaout17".freeze]
  s.date = "2011-08-08"
  s.description = "Unicode support for hirb".freeze
  s.email = ["miaout17 at gmail dot com".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Unicode support for hirb".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<hirb>.freeze, ["~> 0.5"])
    s.add_runtime_dependency(%q<unicode-display_width>.freeze, ["~> 0.1.1"])
    s.add_development_dependency(%q<bacon>.freeze, [">= 1.1.0"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_development_dependency(%q<mocha-on-bacon>.freeze, [">= 0"])
    s.add_development_dependency(%q<bacon-bits>.freeze, [">= 0"])
  else
    s.add_dependency(%q<hirb>.freeze, ["~> 0.5"])
    s.add_dependency(%q<unicode-display_width>.freeze, ["~> 0.1.1"])
    s.add_dependency(%q<bacon>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<mocha-on-bacon>.freeze, [">= 0"])
    s.add_dependency(%q<bacon-bits>.freeze, [">= 0"])
  end
end
