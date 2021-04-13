require 'test_helper'

class V1::MailsControllerTest < ActionDispatch::IntegrationTest
  test "should get request_verification" do
    get v1_mails_request_verification_url
    assert_response :success
  end

end
