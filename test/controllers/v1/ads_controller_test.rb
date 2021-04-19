require 'test_helper'

class V1::AdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_ads_index_url
    assert_response :success
  end

  test "should get create" do
    get v1_ads_create_url
    assert_response :success
  end

  test "should get update" do
    get v1_ads_update_url
    assert_response :success
  end

  test "should get destroy" do
    get v1_ads_destroy_url
    assert_response :success
  end

end
