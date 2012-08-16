require 'test_helper'

class ButtonsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)
    
    @proposal = proposals(:one)
    @project.proposals << @proposal
    
    @button = buttons(:one)
    @proposal.button = @button
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buttons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create button" do
    assert_difference('Button.count') do
      post :create, button: { background_colour: @button.background_colour, colour: @button.colour, force_required: @button.force_required, height: @button.height, length_or_radius: @button.length_or_radius, one_finger_press: @button.one_finger_press, pressing: @button.pressing, proposal_id: @button.proposal_id, pulling: @button.pulling, pushing: @button.pushing, shape: @button.shape, sliding: @button.sliding, thumb_press: @button.thumb_press, turning: @button.turning, two_fingers_press: @button.two_fingers_press, width: @button.width }
    end

    assert_redirected_to button_path(assigns(:button))
  end

  test "should show button" do
    get :show, id: @button
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @button
    assert_response :success
  end

  test "should update button" do
    put :update, id: @button, button: { background_colour: @button.background_colour, colour: @button.colour, force_required: @button.force_required, height: @button.height, length_or_radius: @button.length_or_radius, one_finger_press: @button.one_finger_press, pressing: @button.pressing, proposal_id: @button.proposal_id, pulling: @button.pulling, pushing: @button.pushing, shape: @button.shape, sliding: @button.sliding, thumb_press: @button.thumb_press, turning: @button.turning, two_fingers_press: @button.two_fingers_press, width: @button.width }
    assert_redirected_to button_path(assigns(:button))
  end

  test "should destroy button" do
    assert_difference('Button.count', -1) do
      delete :destroy, id: @button
    end

    assert_redirected_to buttons_path
  end
end
