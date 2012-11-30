require 'test_helper'

class FinishingValuesControllerTest < ActionController::TestCase
  setup do
    @finishing_value = finishing_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finishing_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finishing_value" do
    assert_difference('FinishingValue.count') do
      post :create, finishing_value: { name: @finishing_value.name }
    end

    assert_redirected_to finishing_value_path(assigns(:finishing_value))
  end

  test "should show finishing_value" do
    get :show, id: @finishing_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finishing_value
    assert_response :success
  end

  test "should update finishing_value" do
    put :update, id: @finishing_value, finishing_value: { name: @finishing_value.name }
    assert_redirected_to finishing_value_path(assigns(:finishing_value))
  end

  test "should destroy finishing_value" do
    assert_difference('FinishingValue.count', -1) do
      delete :destroy, id: @finishing_value
    end

    assert_redirected_to finishing_values_path
  end
end
