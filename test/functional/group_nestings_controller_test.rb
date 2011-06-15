require 'test_helper'

class GroupNestingsControllerTest < ActionController::TestCase
  setup do
    @group_nesting = group_nestings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_nestings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_nesting" do
    assert_difference('GroupNesting.count') do
      post :create, :group_nesting => @group_nesting.attributes
    end

    assert_redirected_to group_nesting_path(assigns(:group_nesting))
  end

  test "should show group_nesting" do
    get :show, :id => @group_nesting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @group_nesting.to_param
    assert_response :success
  end

  test "should update group_nesting" do
    put :update, :id => @group_nesting.to_param, :group_nesting => @group_nesting.attributes
    assert_redirected_to group_nesting_path(assigns(:group_nesting))
  end

  test "should destroy group_nesting" do
    assert_difference('GroupNesting.count', -1) do
      delete :destroy, :id => @group_nesting.to_param
    end

    assert_redirected_to group_nestings_path
  end
end
