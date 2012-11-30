require 'test_helper'

class MaintenanceValuesControllerTest < ActionController::TestCase
  setup do
    @maintenance_value = maintenance_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenance_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance_value" do
    assert_difference('MaintenanceValue.count') do
      post :create, maintenance_value: { name: @maintenance_value.name }
    end

    assert_redirected_to maintenance_value_path(assigns(:maintenance_value))
  end

  test "should show maintenance_value" do
    get :show, id: @maintenance_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenance_value
    assert_response :success
  end

  test "should update maintenance_value" do
    put :update, id: @maintenance_value, maintenance_value: { name: @maintenance_value.name }
    assert_redirected_to maintenance_value_path(assigns(:maintenance_value))
  end

  test "should destroy maintenance_value" do
    assert_difference('MaintenanceValue.count', -1) do
      delete :destroy, id: @maintenance_value
    end

    assert_redirected_to maintenance_values_path
  end
end
