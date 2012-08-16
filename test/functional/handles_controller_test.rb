require 'test_helper'

class HandlesControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)
    
    @proposal = proposals(:one)
    @project.proposals << @proposal
    
    @handle = handles(:one)
    @proposal.handle = @handle
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:handles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create handle" do
    assert_difference('Handle.count') do
      post :create, handle: { carrying: @handle.carrying, 
        cylindrical_grip: @handle.cylindrical_grip, 
        disc_grip: @handle.disc_grip, flat_hand_push: @handle.flat_hand_push, 
        height: @handle.height, holding: @handle.holding, 
        hook_grip: @handle.hook_grip, 
        length_or_radius: @handle.length_or_radius, moving: @handle.moving, 
        pinch_grip: @handle.pinch_grip, power_grip: @handle.power_grip, 
        proposal_id: @handle.proposal_id, shape: @handle.shape, 
        span_grip: @handle.span_grip, spherical_grip: @handle.spherical_grip, 
        width: @handle.width }
    end

    assert_redirected_to handle_path(assigns(:handle))
  end

  test "should show handle" do
    get :show, id: @handle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @handle
    assert_response :success
  end

  test "should update handle" do
    put :update, id: @handle, handle: { carrying: @handle.carrying, 
      cylindrical_grip: @handle.cylindrical_grip, disc_grip: @handle.disc_grip, 
      flat_hand_push: @handle.flat_hand_push, height: @handle.height, 
      holding: @handle.holding, hook_grip: @handle.hook_grip, 
      length_or_radius: @handle.length_or_radius, moving: @handle.moving, 
      pinch_grip: @handle.pinch_grip, power_grip: @handle.power_grip, 
      proposal_id: @handle.proposal_id, shape: @handle.shape, 
      span_grip: @handle.span_grip, spherical_grip: @handle.spherical_grip, 
      width: @handle.width }
    assert_redirected_to handle_path(assigns(:handle))
  end

  test "should destroy handle" do
    assert_difference('Handle.count', -1) do
      delete :destroy, id: @handle
    end

    assert_redirected_to handles_path
  end
end
