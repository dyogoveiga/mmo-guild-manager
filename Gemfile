source "https://rubygems.org"

# Default Rails Gems
gem "bootsnap", require: false
gem "jbuilder"
gem "importmap-rails"
gem "puma", ">= 5.0"
gem "rails", "~> 8.0.1"
gem "stimulus-rails"
gem "sprockets-rails"
gem "sqlite3", ">= 1.4"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "pry-rails"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Added Gems
gem "devise", "~> 4.9"
gem "omniauth", "~> 2.1"
gem "omniauth-discord", "~> 1.2"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "slim", "~> 5.2", ">= 5.2.1"
gem "simple_form", "~> 5.3", ">= 5.3.1"

gem "dotenv-rails", groups: [ :development, :test ]
