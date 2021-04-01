require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { avatar: @user.avatar, birthday: @user.birthday, confirmation_digest: @user.confirmation_digest, confirmation_sent_at: @user.confirmation_sent_at, confirmed_at: @user.confirmed_at, description: @user.description, email: @user.email, gender: @user.gender, nickname: @user.nickname, password_digest: @user.password_digest, phone: @user.phone, qq_id: @user.qq_id, qq_id_digest: @user.qq_id_digest, reset_password_digest: @user.reset_password_digest, reset_password_sent_at: @user.reset_password_sent_at, session_digest: @user.session_digest, wechat_id: @user.wechat_id, wechat_id_digest: @user.wechat_id_digest } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { avatar: @user.avatar, birthday: @user.birthday, confirmation_digest: @user.confirmation_digest, confirmation_sent_at: @user.confirmation_sent_at, confirmed_at: @user.confirmed_at, description: @user.description, email: @user.email, gender: @user.gender, nickname: @user.nickname, password_digest: @user.password_digest, phone: @user.phone, qq_id: @user.qq_id, qq_id_digest: @user.qq_id_digest, reset_password_digest: @user.reset_password_digest, reset_password_sent_at: @user.reset_password_sent_at, session_digest: @user.session_digest, wechat_id: @user.wechat_id, wechat_id_digest: @user.wechat_id_digest } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
