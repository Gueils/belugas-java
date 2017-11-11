source 'https://rubygems.org'

# Specify your gem's dependencies in belugas-java.gemspec
gemspec
gem 'nokogiri', '~> 1.6', '>= 1.6.7.2'

group :development, :test do
  gem 'bundler-audit', require: false
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'reek'
  gem 'rubocop'
end

group :test do
  gem 'guard-bundler'
  gem 'guard-bundler-audit'
  gem 'guard-puma'
  gem 'guard-reek'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers', '~> 3.1'
end
