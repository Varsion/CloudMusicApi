require 'test_helper'

class V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get creat" do
    get v1_sessions_creat_url
    assert_response :success
  end

  test "should get destory" do
    get v1_sessions_destory_url
    assert_response :success
  end

end
