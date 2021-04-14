require 'test_helper'

class V1::CodesControllerTest < ActionDispatch::IntegrationTest
  test "should get request_email_code" do
    get v1_codes_request_email_code_url
    assert_response :success
  end

end
