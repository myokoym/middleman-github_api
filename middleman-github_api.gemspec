# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-github_api"
  s.version     = "0.0.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Masafumi Yokoyama"]
  s.email       = ["myokoym@gmail.com"]
  s.homepage    = "https://github.com/myokoym/middleman-github_api"
  s.summary     = %q{A Middleman extension for GitHub API.}
  s.description = s.summary
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.4.0"])
  s.add_runtime_dependency("octokit", "~> 4.0")
end
