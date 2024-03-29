require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:iPhone)
    @project.proposals << proposals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { final_price: @project.final_price, 
        name: "Other name", target_market: @project.target_market, 
        timescale: @project.timescale, volume_of_sale: @project.volume_of_sale }
    end

    assert_redirected_to proposals_url
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should show project results" do
    get :results, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { final_price: @project.final_price, 
      name: @project.name, target_market: @project.target_market, 
      timescale: @project.timescale, volume_of_sale: @project.volume_of_sale }
    assert_redirected_to proposals_url
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
