require 'bundler/capistrano'

default_run_options[:pty] = true

set :application, "start_here"
set :user, ''
set :domain, ''
set :applicationdir, "/var/www/apps/#{application}"

set :scm, :git
set :scm_username, ''
set :repository,  "git@github.com:#{scm_username}/#{application}.git"
set :scm_passphrase, ''
set :branch, 'master'
set :scm_verbose, true
set :deploy_to, applicationdir
set :deploy_via, :copy
set :copy_cache, true
set :copy_exclude, [".git", ".gitignore", ".bundle", ".rspec", ".rvmrc"]

# roles (servers)
role :web, domain
role :app, domain

# additional settings
ssh_options[:username] = ''
ssh_options[:keys] = %w(/Users/phu/.ssh/the_key)

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end