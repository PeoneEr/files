require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/deploytags'
require 'capistrano/passenger'
require 'capistrano-db-tasks'
#require "whenever/capistrano"

set :rvm_type, :user
set :rvm_ruby_version, '2.0.0-p481'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
