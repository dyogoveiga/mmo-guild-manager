require "test_helper"

class SigninsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get signins_index_url
    assert_response :success
  end
end
