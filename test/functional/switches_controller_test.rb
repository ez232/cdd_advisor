require 'test_helper'

class SwitchesControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)

    @proposal = proposals(:one)
    @project.proposals << @proposal

    @switch = switches(:one)
    @proposal.switch = @switch
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switch" do
    assert_difference('Switch.count') do
      post :create, switch: { background_colour: @switch.background_colour, 
        colour: @switch.colour, disc_grip: @switch.disc_grip, 
        flat_hand_push: @switch.flat_hand_push, 
        force_required: @switch.force_required, height: @switch.height, 
        length_or_radius: @switch.length_or_radius, 
        one_finger_press: @switch.one_finger_press, 
        pinch_grip: @switch.pinch_grip, pressing: @switch.pressing, 
        proposal_id: @switch.proposal_id, pulling: @switch.pulling, 
        pushing: @switch.pushing, shape: @switch.shape, 
        sliding: @switch.sliding, span_grip: @switch.span_grip, 
        spherical_grip: @switch.spherical_grip, 
        thumb_press: @switch.thumb_press, turning: @switch.turning, 
        two_fingers_press: @switch.two_fingers_press, width: @switch.width }
    end

    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should show switch" do
    get :show, id: @switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @switch
    assert_response :success
  end

  test "should update switch" do
    put :update, id: @switch, switch: { 
      background_colour: @switch.background_colour, colour: @switch.colour, 
      disc_grip: @switch.disc_grip, flat_hand_push: @switch.flat_hand_push, 
      force_required: @switch.force_required, height: @switch.height, 
      length_or_radius: @switch.length_or_radius, 
      one_finger_press: @switch.one_finger_press, 
      pinch_grip: @switch.pinch_grip, pressing: @switch.pressing, 
      proposal_id: @switch.proposal_id, pulling: @switch.pulling, 
      pushing: @switch.pushing, shape: @switch.shape, sliding: @switch.sliding, 
      span_grip: @switch.span_grip, spherical_grip: @switch.spherical_grip, 
      thumb_press: @switch.thumb_press, turning: @switch.turning, 
      two_fingers_press: @switch.two_fingers_press, width: @switch.width }
    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should destroy switch" do
    assert_difference('Switch.count', -1) do
      delete :destroy, id: @switch
    end

    assert_redirected_to switches_path
  end
end
