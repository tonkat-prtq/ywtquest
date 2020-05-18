# -*- encoding: utf-8 -*-
# stub: kaminari-bootstrap 3.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "kaminari-bootstrap".freeze
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["mcasimir".freeze]
  s.date = "2013-11-27"
  s.description = "Kaminari views for Twitter Bootstrap (rails engine)".freeze
  s.email = "maurizio.cas@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "http://github.com/mcasimir/kaminari-bootstrap".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Kaminari views for Twitter Bootstrap (rails engine)".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<kaminari>.freeze, [">= 0.13.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<jeweler>.freeze, [">= 1.8.5"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<kaminari>.freeze, [">= 0.13.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<jeweler>.freeze, [">= 1.8.5"])
  end
end
