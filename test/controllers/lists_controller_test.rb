require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get inde" do
    get :inde
    assert_response :success
  end

end
