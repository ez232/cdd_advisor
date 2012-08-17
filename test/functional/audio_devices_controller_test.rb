require 'test_helper'

class AudioDevicesControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)
    
    @proposal = proposals(:one)
    @project.proposals << @proposal
    
    @audio_device = audio_devices(:one)
    @proposal.audio_device = @audio_device
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audio_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audio_device" do
    assert_difference('AudioDevice.count') do
      post :create, audio_device: { proposal_id: @audio_device.proposal_id, range_of_volume_specifications: @audio_device.range_of_volume_specifications, sound_volume_specifications: @audio_device.sound_volume_specifications }
    end

    assert_redirected_to audio_device_path(assigns(:audio_device))
  end

  test "should show audio_device" do
    get :show, id: @audio_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audio_device
    assert_response :success
  end

  test "should update audio_device" do
    put :update, id: @audio_device, audio_device: { proposal_id: @audio_device.proposal_id, range_of_volume_specifications: @audio_device.range_of_volume_specifications, sound_volume_specifications: @audio_device.sound_volume_specifications }
    assert_redirected_to audio_device_path(assigns(:audio_device))
  end

  test "should destroy audio_device" do
    assert_difference('AudioDevice.count', -1) do
      delete :destroy, id: @audio_device
    end

    assert_redirected_to audio_devices_path
  end
end
