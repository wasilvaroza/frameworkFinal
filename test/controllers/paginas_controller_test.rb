require 'test_helper'

class PaginasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get localizacao" do
    get :localizacao
    assert_response :success
  end

end
