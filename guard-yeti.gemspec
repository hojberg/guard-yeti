# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)
require "guard/yeti/version"

Gem::Specification.new do |s|
  s.name        = "guard-yeti"
  s.version     = Guard::Yeti::VERSION
  s.authors     = ["Simon Højberg"]
  s.email       = ["r.hackr@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "guard-yeti"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "guard"

  s.add_development_dependency "minitest"
  s.add_development_dependency "guard-minitest"
end
