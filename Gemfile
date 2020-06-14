source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.x'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'twitter-bootstrap-rails'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cpf_cnpj'
gem 'bcrypt', '3.1.12'
gem 'devise'
gem 'jquery-rails' 

gem 'pg', '>= 0.18', '< 2.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'capybara'
  gem 'listen'
  gem 'sqlite3', '~> 1.4'
  gem 'factory_bot_rails'
end

group :development do.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  
  gem 'selenium-webdriver'
  gem 'webdrivers'

  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
