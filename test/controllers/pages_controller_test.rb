require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get nhome" do
    get :nhome
    assert_response :success
  end

end
