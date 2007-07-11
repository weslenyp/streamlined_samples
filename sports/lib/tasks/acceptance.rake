require 'daemons/daemonize'
                            
def assert_env(env)
  ENV[env] or raise "Environment variable #{env} must be set"
end             

def assert_gem(name)
  gem name
end

namespace :test do
  namespace :acceptance do
    desc "Start servers for acceptance testing"
    task :setup do   
      assert_env('JAVA_HOME')
      assert_gem('mongrel')
      mkdir_p "tmp/selenium"
      system "mongrel_rails start -d -e test"
      system "ruby vendor/plugins/streamlined/lib/selenium/server.rb start"
    end
    Rake::TestTask.new(:run => "db:test:prepare") do |t|
      t.libs << "test"         
      # we must delete TEST, not just read it, to prevent Jim's automatic interpretation
      name = ENV.delete('TEST') || '**/*_test'
      t.pattern = "test/acceptance/#{name}.rb"
      method = ENV.delete('METHOD')
      t.options = "--name=#{method}" unless method.nil?
      t.verbose = true
    end
    Rake::Task['test:acceptance:run'].comment = "Run the acceptance tests (start servers manually!)"
    desc "Stop servers for acceptance testing"
    task :teardown do
      system "mongrel_rails stop"
      system "ruby vendor/plugins/streamlined/lib/selenium/server.rb stop"
    end
    desc "Stop, then start the servers"
    task :restart do
      Rake::Task['test:acceptance:teardown'].invoke
      Rake::Task['test:acceptance:setup'].invoke
    end
  end
  desc "Run the acceptance tests, starts and stops servers"
  task :acceptance do
    Rake::Task['test:acceptance:setup'].invoke
    Rake::Task['test:acceptance:run'].invoke
    Rake::Task['test:acceptance:teardown'].invoke
  end
end