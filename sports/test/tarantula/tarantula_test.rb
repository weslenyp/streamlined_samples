require "#{File.dirname(__FILE__)}/../test_helper"
require 'relevance/tarantula'

class TarantulaTest < ActionController::IntegrationTest
  fixtures :all

  def test_without_login
    t = tarantula_crawler(self)
    # t.handlers << Relevance::Tarantula::TidyHandler.new
    t.crawl("/")
  end
  
end
