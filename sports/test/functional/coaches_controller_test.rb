require File.dirname(__FILE__) + '/../test_helper'
require 'coaches_controller'

# Re-raise errors caught by the controller.
class CoachesController; def rescue_action(e) raise e end; end

class CoachesControllerTest < Test::Unit::TestCase
  def setup
    @controller = CoachesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
