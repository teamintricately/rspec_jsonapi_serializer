# frozen_string_literal: true

require_relative "lib/rspec_jsonapi_serializer/version"

Gem::Specification.new do |spec|
  spec.name          = "rspec_jsonapi_serializer"
  spec.version       = RSpecJSONAPISerializer::VERSION
  spec.authors       = ["Mateus Cruz"]
  spec.email         = ["mateus@intricately.com"]
  spec.summary       = "RSpec matchers for jsonapi-serializer."
  spec.homepage      = "https://github.com/teamintricately/rspec_jsonapi_serializer"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["lib/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "jsonapi-serializer", "~> 2.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
