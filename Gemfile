source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


#--------------------------#
#---- MES GEMS ----#
#--------------------------#
gem "bootstrap_form"
gem "rolify"
gem 'autoprefixer-rails'
gem 'administrate'
gem 'sitemap_generator'
gem 'local_time'
group :development do
  gem "awesome_print", require:"ap"
  gem 'bullet'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-byebug'
  gem 'meta_request'
end
gem 'rails_db'
gem "axlsx_rails"
group :production do
  gem "passenger"
  # Use mysql as the database for Active Record
  # gem 'mysql2', '>= 0.4.4', '< 0.6.0'
  gem 'postmark-rails'
  gem 'redis-rails'
  gem 'redis-rack-cache'
end
# gem 'dalli'
gem 'rails-i18n'
gem "cocoon"
gem 'devise'
gem 'devise-i18n'
gem "simple_form"
gem 'friendly_id'
gem 'cancancan'
gem 'gibbon'
gem 'pagy'
# gem 'stripe'
# gem 'stripe-rails'
gem 'activeadmin'
gem 'name_of_person'
gem 'meta-tags', '~> 2.11'
gem 'activestorage-validator'
gem 'cloudinary'
gem 'activestorage-cloudinary-service'

gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
# gem 'geocoder', '~> 1.4', '>= 1.4.7'
# gem 'gmaps4rails', '~> 2.1', '>= 2.1.2'
gem "seedbank"
# gem 'ahoy_matey'
# gem 'webpacker', '~> 3.5'
# gem 'country_select'
gem 'faker'
gem 'active_link_to'
gem "pundit"
# gem "devise_invitable"
gem 'globalize'
gem 'acts-as-taggable-on'
gem 'acts_as_votable'
gem 'data-confirm-modal'
gem 'prawn'
gem 'prawn-qrcode'

gem 'populator'

gem 'acts_as_commentable'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'counter_culture'
gem 'public_activity'

gem 'impressionist'

gem 'fastentry'

gem "table_print"

gem "breadcrumbs_on_rails"
gem 'has_friendship'

gem 'file_validators'
gem 'email_validator'

gem 'rails_autolink'
# gem 'strong_migrations'
gem 'inline_svg'

# Shrine Dependencies
gem 'fastimage'
gem 'image_processing'
gem 'mini_magick'
gem 'shrine'

# Pour l'upload de fichier.
gem 'carrierwave', '~> 1.3', '>= 1.3.1'

# Pour systeme de recherche dans une bdd, utile pour les formulaire de recherche.
gem "pg_search"
gem 'search_cop'
gem 'ransack'

# Ces gem nécessite que elasticsearch soit installé sur la machine
# gem 'searchkick'
# gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: '5.x'
# gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: '5.x'
# Pour systeme de recherche dans une bdd, utile pour les formulaire de recherche.

gem "htmlcompressor"
gem "yui-compressor"
gem 'babel-transpiler'