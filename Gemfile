source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in go_bucks.gemspec.
gemspec

gem "puma"

gem "sqlite3"

gem "sprockets-rails"
gem "haml-rails", "~> 2.1", ">= 2.1.0"
gem "devise", '~> 4.9', ">= 4.9.3"
gem 'will_paginate', '~> 3.1.7'
gem 'will_paginate-bootstrap4'
gem "pundit", ">= 2.3.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", ">= 6.0.0"
  gem "factory_bot_rails", ">= 6.2.0"
  gem "faker"
end

group :test do
  gem 'shoulda-matchers', '~> 5.3', '>= 5.3.0'
end
