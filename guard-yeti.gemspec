# encoding: UTF-8

Gem::Specification.new do |s|
  s.name        = "guard-yeti"
  s.version     = "0.0.3"
  s.authors     = ["Simon Højberg", "Christopher Meiklejohn"]
  s.email       = ["r.hackr@gmail.com", "christopher.meiklejohn@gmail.com"]
  s.homepage    = "https://github.com/hojberg/guard-yeti"
  s.summary     = %q{Guard::Yeti automatically run's your YUI tests via Yeti}
  s.description = %q{Guard watches files. Use guard-yeti to run your YUI unit test via Yeti, when your implementation files change}

  s.rubyforge_project = "guard-yeti"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "guard"
  s.add_dependency "rake"

  s.add_development_dependency "minitest"
  s.add_development_dependency "guard-minitest"
end
