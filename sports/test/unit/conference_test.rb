require File.dirname(__FILE__) + '/../test_helper'

class ConferenceTest < Test::Unit::TestCase
  fixtures :leagues
  set_fixture_class :leagues => Conference 

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
