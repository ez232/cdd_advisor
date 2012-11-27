class HandlesController < ApplicationController
  # GET projects/1/proposals/1/handles
  def index
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @handles = @proposal.handles
  end

  # GET projects/1/proposals/1/handles/new
  def new
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @handle = @proposal.handles.build
  end

  # POST projects/1/proposals/1/handles
  def create
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @handle = @proposal.handles.build(params[:handle])

    if @handle.save
      redirect_to project_proposal_handles_url(@project, @proposal),
        notice: 'Handle was successfully created.'
    else
      render action: 'new'
    end
  end

  # GET projects/1/proposals/1/handles/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @handle = @proposal.handles.find(params[:id])
  end

  # PUT projects/1/proposals/1/handles/1
  def update
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @handle = @proposal.handles.find(params[:id])

    if @handle.update_attributes(params[:handle])
      redirect_to project_proposal_handles_url(@project, @proposal),
        notice: 'Handle was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/proposals/1/handles/1
  def destroy
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @handle = @proposal.handles.find(params[:id])
    @handle.destroy

    redirect_to project_proposal_handles_url
  end

  # GET projects/1/proposals/1/handles/1
  # def show
  #   @handle = Handle.find(params[:id])
  # end
end
