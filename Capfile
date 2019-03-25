# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
require 'capistrano/setup'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rbenv"
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/puma'
require 'capistrano/nginx'
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx
require 'capistrano/rake'

# require "capistrano/rails/assets"
# require "capistrano/rails/migrations"
#require 'capistrano/dotenv'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
