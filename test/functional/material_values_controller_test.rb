require 'test_helper'

class MaterialValuesControllerTest < ActionController::TestCase
  setup do
    @material_value = material_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_value" do
    assert_difference('MaterialValue.count') do
      post :create, material_value: { category: @material_value.category, name: @material_value.name }
    end

    assert_redirected_to material_value_path(assigns(:material_value))
  end

  test "should show material_value" do
    get :show, id: @material_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_value
    assert_response :success
  end

  test "should update material_value" do
    put :update, id: @material_value, material_value: { category: @material_value.category, name: @material_value.name }
    assert_redirected_to material_value_path(assigns(:material_value))
  end

  test "should destroy material_value" do
    assert_difference('MaterialValue.count', -1) do
      delete :destroy, id: @material_value
    end

    assert_redirected_to material_values_path
  end
end
