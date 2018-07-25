require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end
end
