# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gcs_api_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "gcs_api_gem"
  spec.version       = GcsApiGem::VERSION
  spec.authors       = ["Yuta Takahashi"]
  spec.email         = ["m1205123ing@gmail.com"]

  spec.summary       = %q{Google Custom Search API gem.}
  spec.description   = %q{Google Custom Search API gem.}
  spec.homepage      = "https://github.com/tashua314/gcs_api_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httpclient", "~> 2.8.3"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "0.10.4"
  spec.add_development_dependency "pry-byebug", "3.5.1"
end
