require 'test_helper'

class LabelsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)

    @proposal = proposals(:one)
    @project.proposals << @proposal

    @label = labels(:one)
    @proposal.label = @label
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create label" do
    assert_difference('Label.count') do
      post :create, label: { digital: @label.digital, font_type: @label.font_type, reading_distance: @label.reading_distance, printed: @label.printed, proposal_id: @label.proposal_id, text_colour: @label.text_colour, text_size: @label.text_size }
    end

    assert_redirected_to label_path(assigns(:label))
  end

  test "should show label" do
    get :show, id: @label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @label
    assert_response :success
  end

  test "should update label" do
    put :update, id: @label, label: { digital: @label.digital, font_type: @label.font_type, reading_distance: @label.reading_distance, printed: @label.printed, proposal_id: @label.proposal_id, text_colour: @label.text_colour, text_size: @label.text_size }
    assert_redirected_to label_path(assigns(:label))
  end

  test "should destroy label" do
    assert_difference('Label.count', -1) do
      delete :destroy, id: @label
    end

    assert_redirected_to labels_path
  end
end
