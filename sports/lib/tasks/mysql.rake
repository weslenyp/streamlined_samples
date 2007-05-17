def dev_and_test
  configs = ActiveRecord::Base.configurations
  dev = configs['development']
  test = configs['test']
  [dev,test]
end

namespace :db do
  namespace :mysql do
    desc 'Build the MySQL dev & test databases'
    task :create=>[:environment] do 
      dev_and_test.each {|db|
        pflag = db['password'] ? "-p#{db['password']}" : ''
        %x( mysqladmin -u #{db['username']} #{pflag} create #{db['database']} ) 
      }
    end
    
    desc 'Drop the MySQL dev & test databases'
    task :drop=>[:environment] do 
      dev_and_test.each {|db| 
        pflag = db['password'] ? "-p#{db['password']}" : ''
        # MUST use double quotes in this command for compatability with Windows
        %x(mysql -u #{db['username']} #{pflag} -e "drop database if exists #{db['database']}")
      }
    end
 
    desc 'Rebuild the MySQL test databases'
    task :recreate => [:drop, :create]
  end
end
