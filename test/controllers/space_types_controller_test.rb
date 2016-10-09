require 'test_helper'

class SpaceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space_type = space_types(:one)
  end

  test "should get index" do
    get space_types_url
    assert_response :success
  end

  test "should get new" do
    get new_space_type_url
    assert_response :success
  end

  test "should create space_type" do
    assert_difference('SpaceType.count') do
      post space_types_url, params: { space_type: { name: @space_type.name } }
    end

    assert_redirected_to space_type_url(SpaceType.last)
  end

  test "should show space_type" do
    get space_type_url(@space_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_space_type_url(@space_type)
    assert_response :success
  end

  test "should update space_type" do
    patch space_type_url(@space_type), params: { space_type: { name: @space_type.name } }
    assert_redirected_to space_type_url(@space_type)
  end

  test "should destroy space_type" do
    assert_difference('SpaceType.count', -1) do
      delete space_type_url(@space_type)
    end

    assert_redirected_to space_types_url
  end
end
