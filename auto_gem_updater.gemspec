
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "auto_gem_updater/version"

Gem::Specification.new do |spec|
  spec.name          = "auto_gem_updater"
  spec.version       = AutoGemUpdater::VERSION
  spec.authors       = ["Harry Venables"]
  spec.email         = ["harry@tagadab.com"]

  spec.summary       = %q{Auto Update Gems}
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/hvenables/auto_gem_updater"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
