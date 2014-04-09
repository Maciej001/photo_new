source 'https://rubygems.org'
ruby '2.1.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
gem 'bcrypt-ruby', '3.1.2'
gem 'faker'
gem 'will_paginate'

group :development, :test do
	gem 'sqlite3'   # sqlite3 for ActiveRecord
	gem 'rspec-rails', '2.13.1'
	gem 'guard-rspec', '2.5.0'


	# additions for Spork
	gem 'spork-rails', '4.0.0'
	# gem 'guard-spork', '1.5.0'
 #  gem 'childprocess', '0.3.6'
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.2.1'
end

# Gems used only for assets and not required
# in production environments by default
group :assets do
	gem 'sass-rails'  # use scss for stylesheets
	gem 'compass-rails'  #otoczka :assets dodana na potrzeby compass
	gem 'susy'
	gem "font-awesome-rails"
end

gem 'uglifier', '>= 1.3.0'   # as compressor for JS assets
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end



# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# group :production do
# 	gem 'pg'
# 	gem 'rails_12factor', '0.0.2'
# end