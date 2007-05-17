namespace :app do
  desc "Complete setup to run the app"
  task :setup => ["db:mysql:create", "db:migrate", "db:fixtures:load"]
end
