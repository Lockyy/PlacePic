require "bundler/gem_tasks"
require "rspec/core/rake_task"
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

RSpec::Core::RakeTask.new(:spec)
require File.expand_path('../config/application', __FILE__)

task :default => :spec
Rails.application.load_tasks
