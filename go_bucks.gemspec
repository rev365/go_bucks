require_relative "lib/go_bucks/version"

Gem::Specification.new do |spec|
  spec.name        = "go_bucks"
  spec.version     = GoBucks::VERSION
  spec.authors     = ["Ritchie Paul Buitre"]
  spec.email       = ["ritchie@richorelse.com"]
  spec.homepage    = "https://github.com/rev365/go_bucks"
  spec.summary     = "New internal incentive program to offer points to employees redeemable on “GoMarket"
  spec.description = spec.summary

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", '~> 7.0', ">= 7.0.7.1"
  spec.add_dependency "haml-rails", "~> 2.1", ">= 2.1.0"
  spec.add_dependency "devise", '~> 4.9', ">= 4.9.3"
  spec.add_dependency "will_paginate", '~> 3.1', ">= 3.1.7"
  spec.add_dependency "will_paginate-bootstrap4", '~> 0.2', ">= 0.2.2"
  spec.add_dependency "pundit", "~> 2.3", ">= 2.3.0"
end
