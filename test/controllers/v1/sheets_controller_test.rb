require 'test_helper'

class V1::SheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_sheets_index_url
    assert_response :success
  end

  test "should get create" do
    get v1_sheets_create_url
    assert_response :success
  end

  test "should get show" do
    get v1_sheets_show_url
    assert_response :success
  end

  test "should get update" do
    get v1_sheets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get v1_sheets_destroy_url
    assert_response :success
  end

end
