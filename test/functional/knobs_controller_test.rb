require 'test_helper'

class KnobsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)
    
    @proposal = proposals(:one)
    @project.proposals << @proposal
    
    @knob = knobs(:one)
    @proposal.knob = @knob
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knob" do
    assert_difference('Knob.count') do
      post :create, knob: { background_colour: @knob.background_colour, 
        colour: @knob.colour, cylindrical_grip: @knob.cylindrical_grip, 
        disc_grip: @knob.disc_grip, force_required: @knob.force_required, 
        height: @knob.height, length_or_radius: @knob.length_or_radius, 
        one_finger_press: @knob.one_finger_press, pinch_grip: @knob.pinch_grip, 
        pressing: @knob.pressing, proposal_id: @knob.proposal_id, 
        pulling: @knob.pulling, pushing: @knob.pushing, shape: @knob.shape, 
        sliding: @knob.sliding, span_grip: @knob.span_grip, 
        spherical_grip: @knob.spherical_grip, 
        thumb_press: @knob.thumb_press, turning: @knob.turning, 
        two_fingers_press: @knob.two_fingers_press, width: @knob.width }
    end

    assert_redirected_to knob_path(assigns(:knob))
  end

  test "should show knob" do
    get :show, id: @knob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knob
    assert_response :success
  end

  test "should update knob" do
    put :update, id: @knob, knob: { background_colour: @knob.background_colour, 
      colour: @knob.colour, cylindrical_grip: @knob.cylindrical_grip, 
      disc_grip: @knob.disc_grip, force_required: @knob.force_required, 
      height: @knob.height, length_or_radius: @knob.length_or_radius, 
      one_finger_press: @knob.one_finger_press, pinch_grip: @knob.pinch_grip, 
      pressing: @knob.pressing, proposal_id: @knob.proposal_id, 
      pulling: @knob.pulling, pushing: @knob.pushing, shape: @knob.shape, 
      sliding: @knob.sliding, span_grip: @knob.span_grip, 
      spherical_grip: @knob.spherical_grip, thumb_press: @knob.thumb_press, 
      turning: @knob.turning, two_fingers_press: @knob.two_fingers_press, 
      width: @knob.width }
    assert_redirected_to knob_path(assigns(:knob))
  end

  test "should destroy knob" do
    assert_difference('Knob.count', -1) do
      delete :destroy, id: @knob
    end

    assert_redirected_to knobs_path
  end
end
