require "test_helper"

class WalkControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get walk_show_url
    assert_response :success
  end

  test "should get create" do
    get walk_create_url
    assert_response :success
  end
end
