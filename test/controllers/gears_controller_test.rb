require "test_helper"

class GearsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get gears_home_url
    assert_response :success
  end
end
