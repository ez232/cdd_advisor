require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)
    
    @proposal = proposals(:one)
    @project.proposals << @proposal
    
    @image = images(:one)
    @proposal.images << @image
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image" do
    assert_difference('Image.count') do
      post :create, image: { name: @image.name, 
        proposal_id: @image.proposal_id }
    end

    assert_redirected_to image_path(assigns(:image))
  end

  test "should show image" do
    get :show, id: @image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image
    assert_response :success
  end

  test "should update image" do
    put :update, id: @image, image: { name: @image.name }
    assert_redirected_to image_path(assigns(:image))
  end

  test "should destroy image" do
    assert_difference('Image.count', -1) do
      delete :destroy, id: @image
    end

    assert_redirected_to images_path
  end
end
