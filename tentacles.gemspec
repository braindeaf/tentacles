$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tentacles/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tentacles"
  s.version     = Tentacles::VERSION
  s.authors     = ["Rob Lacey"]
  s.email       = ["contact@robl.me"]
  s.homepage    = "http://robl.me/gems/tentacles"
  s.summary     = "Rails model admin interface"
  s.description = "Taking the best parts of all the Rails admin interfaces."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0", "< 5.3"
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
end
