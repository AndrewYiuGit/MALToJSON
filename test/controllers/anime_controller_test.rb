require 'test_helper'

class AnimeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
