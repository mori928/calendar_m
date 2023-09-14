require "test_helper"

class YoyakuControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yoyaku_index_url
    assert_response :success
  end
end
