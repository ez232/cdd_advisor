require 'test_helper'

class OpeningDevicesControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)
    
    @proposal = proposals(:one)
    @project.proposals << @proposal
    
    @opening_device = opening_devices(:one)
    @proposal.opening_device = @opening_device
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opening_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opening_device" do
    assert_difference('OpeningDevice.count') do
      post :create, opening_device: { 
        is_opening_device: @opening_device.is_opening_device, 
        proposal_id: @opening_device.proposal_id }
    end

    assert_redirected_to opening_device_path(assigns(:opening_device))
  end

  test "should show opening_device" do
    get :show, id: @opening_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opening_device
    assert_response :success
  end

  test "should update opening_device" do
    put :update, id: @opening_device, opening_device: { 
      is_opening_device: @opening_device.is_opening_device, 
      proposal_id: @opening_device.proposal_id }
    assert_redirected_to opening_device_path(assigns(:opening_device))
  end

  test "should destroy opening_device" do
    assert_difference('OpeningDevice.count', -1) do
      delete :destroy, id: @opening_device
    end

    assert_redirected_to opening_devices_path
  end
end
