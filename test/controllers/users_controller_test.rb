require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { bio: @user.bio, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password_digest: @user.password_digest, profile_img_url: @user.profile_img_url, wallet: @user.wallet, wallet: @user.wallet } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { bio: @user.bio, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password_digest: @user.password_digest, profile_img_url: @user.profile_img_url, wallet: @user.wallet, wallet: @user.wallet } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end