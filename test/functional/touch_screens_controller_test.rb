require 'test_helper'

class TouchScreensControllerTest < ActionController::TestCase
    setup do
    @project = projects(:iPhone)
    
    @proposal = proposals(:one)
    @project.proposals << @proposal
    
    @touch_screen = touch_screens(:one)
    @proposal.touch_screen = @touch_screen
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:touch_screens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create touch_screen" do
    assert_difference('TouchScreen.count') do
      post :create, touch_screen: { button_height: @touch_screen.button_height, 
        button_length_or_radius: @touch_screen.button_length_or_radius, 
        button_shape: @touch_screen.button_shape, 
        button_width: @touch_screen.button_width, 
        proposal_id: @touch_screen.proposal_id, 
        scroll_bar_height: @touch_screen.scroll_bar_height, 
        scroll_bar_length_or_radius: @touch_screen.scroll_bar_length_or_radius, 
        scroll_bar_shape: @touch_screen.scroll_bar_shape, 
        scroll_bar_width: @touch_screen.scroll_bar_width }
    end

    assert_redirected_to touch_screen_path(assigns(:touch_screen))
  end

  test "should show touch_screen" do
    get :show, id: @touch_screen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @touch_screen
    assert_response :success
  end

  test "should update touch_screen" do
    put :update, id: @touch_screen, touch_screen: { button_height: @touch_screen.button_height, button_length_or_radius: @touch_screen.button_length_or_radius, button_shape: @touch_screen.button_shape, button_width: @touch_screen.button_width, proposal_id: @touch_screen.proposal_id, scroll_bar_height: @touch_screen.scroll_bar_height, scroll_bar_length_or_radius: @touch_screen.scroll_bar_length_or_radius, scroll_bar_shape: @touch_screen.scroll_bar_shape, scroll_bar_width: @touch_screen.scroll_bar_width }
    assert_redirected_to touch_screen_path(assigns(:touch_screen))
  end

  test "should destroy touch_screen" do
    assert_difference('TouchScreen.count', -1) do
      delete :destroy, id: @touch_screen
    end

    assert_redirected_to touch_screens_path
  end
end
