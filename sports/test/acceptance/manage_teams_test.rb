require File.dirname(__FILE__) + '/../test_helper'
require 'selenium/selenium.rb'
require 'relevance/acceptance/test_helper'
require 'relevance/acceptance/crud_test'

class ManageTeamsTest < Test::Unit::TestCase     
  include Relevance::Acceptance::TestHelper
  include Relevance::Acceptance::CrudTest    
                     
  def login!
    open "/"
  end

  # Selenium does not seem to handle normalize-space, so leave no spaces in menu texts!
  def menu_xpath(menu_id, first_text, *rest)
    # first_text is special because its parent ul has the menu id
    # and because it is not wrapped in a ul
    xpath = "xpath=//ul[@id='#{menu_id}']/li[a/text()='#{first_text}']"
    xpath = rest.inject(xpath) {|xpath,text|
      xpath << "/ul/li[a/text()='#{text}']"
    }
    "#{xpath}/a"
  end
   
  def setup
    # Because of Rake's idempotency and lack of attr_accessor for 'already_invoked', we, the undersigned,
    # determined that the platform-independent shell task below is more readable and useful.
    # Rake::Task['db:fixtures:load'].set_instance_variable('already_invoked', false)
    # Rake::Task['db:fixtures:load'].invoke         
    
    `cd "#{RAILS_ROOT}"; rake db:fixtures:load`
    
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleneseInterpreter.new("localhost", 4444, "*firefox", "http://localhost:3000", 10000);
      @selenium.start
    end
    @selenium.set_context("test_new", "info")
  end
  
  def teardown
    @selenium.stop unless $selenium
    assert_equal [], @verification_errors
  end
                                                                   
  model_name_is :team
  
  menu_navigation_to_list_view_is :nav_ul, "Teams"
  
  existing_record_link_text_is "Spurs"
  
  existing_record_data_is [{:label => "Name", :value => "Spurs"}, 
                           {:label => "City", :value => "San Antonio"}]
  
  updates_to_existing_record_data_are [{:label => "Name", :value => "Robisons"}]
  
  new_record_data_is [{:label => "Name", :value => "Wahoos"}, 
                      {:label => "City", :value => "Charlottesville"},
                      {:label => "Sport", :value => "Basketball", :input => :select}]
  
  existing_record_link_text_for_delete_is "Spurs"
end
