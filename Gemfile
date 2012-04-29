source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'heroku'
gem 'thin'
gem 'randumb' # lets you get random records efficiently

# for creating sample database on the server
gem 'faker'

# the postgresql gem
gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
    gem 'rspec-rails'
    gem 'shoulda', :require => false
    gem 'capybara'
    # enables 'save_and_open_page'
    gem 'launchy'
    # guard auto runs test suite on file change
    gem 'guard-rspec'
    gem 'factory_girl_rails'
    gem 'railroady'
    # puts attributes as a comment for each <model>.rb
    gem 'annotate', :git => 'http://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
    # gives some nice tools for rails console.
    gem 'irbtools-more', :require => false
    # gem 'ruby-debug19', :require => 'ruby-debug'
    gem 'guard-cucumber'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
