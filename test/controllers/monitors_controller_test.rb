require 'test_helper'

class MonitorsControllerTest < ActionDispatch::IntegrationTest
  test "should get version" do
    get monitors_version_url
    assert_response :success
  end

end
