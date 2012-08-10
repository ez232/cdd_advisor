require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
  setup do
    @proposal = proposals(:one)
    @project = projects(:iPhone)
  end

  test "should get index" do
    session[:project_id] = @project.id
    get :index
    assert_response :success
    assert_not_nil assigns(:proposals)
  end

  test "should get new" do
    session[:project_id] = @project.id
    get :new
    assert_response :success
  end

  test "should not create proposal" do
    assert_no_difference('Proposal.count') do
      post :create, proposal: { name: "xxx" }
    end

    assert_redirected_to projects_url
  end

  test "should create proposal" do
    assert_difference('Proposal.count') do
      session[:project_id] = @project.id
      post :create, proposal: { name: "xxx" }
    end

    assert_redirected_to proposals_url
  end

  test "should show proposal" do
    session[:project_id] = @project.id
    get :show, id: @proposal
    assert_response :success
  end

  test "should get edit" do
    session[:project_id] = @project.id
    get :edit, id: @proposal
    assert_response :success
  end

  test "should update proposal" do
    session[:project_id] = @project.id
    put :update, id: @proposal, proposal: { name: @proposal.name }
    assert_response :success
  end

  test "should destroy proposal" do
    assert_difference('Proposal.count', -1) do
      session[:project_id] = @project.id
      delete :destroy, id: @proposal
    end

    assert_redirected_to proposals_path
  end
end
