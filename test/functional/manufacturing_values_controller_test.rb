require 'test_helper'

class ManufacturingValuesControllerTest < ActionController::TestCase
  setup do
    @manufacturing_value = manufacturing_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manufacturing_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manufacturing_value" do
    assert_difference('ManufacturingValue.count') do
      post :create, manufacturing_value: { name: @manufacturing_value.name }
    end

    assert_redirected_to manufacturing_value_path(assigns(:manufacturing_value))
  end

  test "should show manufacturing_value" do
    get :show, id: @manufacturing_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manufacturing_value
    assert_response :success
  end

  test "should update manufacturing_value" do
    put :update, id: @manufacturing_value, manufacturing_value: { name: @manufacturing_value.name }
    assert_redirected_to manufacturing_value_path(assigns(:manufacturing_value))
  end

  test "should destroy manufacturing_value" do
    assert_difference('ManufacturingValue.count', -1) do
      delete :destroy, id: @manufacturing_value
    end

    assert_redirected_to manufacturing_values_path
  end
end
