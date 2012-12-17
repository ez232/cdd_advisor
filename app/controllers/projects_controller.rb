class ProjectsController < ApplicationController
  # GET /projects
  def index
    @projects = Project.paginate page: params[:page], order: 'created_at desc',
                                 per_page: 10
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to correct_url(params)
    else
      render action: 'new'
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # GET /projects/1/results
  def results
    @project = Project.find(params[:id])
    @tab = params[:tab] ? params[:tab] : 0
  end


  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to correct_url(params)
    else
      render action: 'edit'
    end
  end

  # GET /projects/1
  # def show
  #   @project = Project.find(params[:id])
  # end

  # DELETE /projects/1
  # def destroy
  #   @project = Project.find(params[:id])
  #   @project.destroy
  #
  #   redirect_to projects_url
  # end

  private
    def correct_url(params)
      case params.select{ |key| key =~ /action_/ }.first[0]
      when 'action_save'
        projects_url
      when 'action_proposals'
        project_proposals_url(@project)
      else
        projects_url
      end
    end
end
