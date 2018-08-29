require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/rails"
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/rails/migrations"
require "capistrano/rails/assets"
require "capistrano/scm/git"
require "capistrano/puma"
require "capistrano/nginx"
require "capistrano/sidekiq"

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
