require "rvm/capistrano"
set :user, 'ubuntu'
set :use_sudo, false
set :domain, 'ec2-23-20-40-143.compute-1.amazonaws.com'
ssh_options[:keys] = ["~/.ec2/helix/helix"]
ssh_options[:forward_agent] = true


set :scm, 'git'
set :repository,  'git@github.com:helixtesting/helix.git'
set :scm_username, "guddu07"
set :scm_passphrase, "Welcome123"
set :deploy_to, "/project/"
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true


set :application, "helix"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
 after "deploy:restart", "deploy:cleanup"
 after "deploy:restart", "create_db"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

task :create_db do 
	run "cd #{current_path} && rake RAILS_ENV=#{rails_env}  db:create "
end