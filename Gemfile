source 'https://rubygems.org'

ruby '2.4.0'

gem 'rails', '~> 5.0'

gem 'activeadmin', github: 'activeadmin'
gem 'active_bootstrap_skin'
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise'
gem 'figaro'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'pg', '0.18.4'
gem 'puma',         '3.4.0'
gem 'sucker_punch', '~> 2.0'
gem 'whenever'

gem 'coffee-rails', '4.2.1'
gem 'jbuilder',     '2.4.1'
gem 'jquery-rails', '4.1.1'
gem 'sass-rails',   '5.0.6'
gem 'turbolinks',   '5.0.1'
gem 'uglifier',     '3.0.0'

group :development, :test do
  gem 'byebug', '9.0.0', platform: :mri
  gem 'pronto'
  gem 'pronto-flay'
  gem 'pronto-rubocop'
end

group :development do
  gem 'web-console',           '3.1.1'
  gem 'listen',                '3.0.8'
  gem 'spring',                '1.7.2'
  gem 'spring-watcher-listen', '2.0.0'
end

group :production, :staging do
  gem 'pg', '0.18.4'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
