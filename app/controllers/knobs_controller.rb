class KnobsController < ApplicationController
  # GET projects/1/proposals/1/knobs
  def index
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @knobs = @proposal.knobs
  end

  # GET projects/1/proposals/1/knobs/new
  def new
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @knob = @proposal.knobs.build
  end

  # POST projects/1/proposals/1/knobs
  def create
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @knob = @proposal.knobs.build(params[:knob])

    if @knob.save
      redirect_to project_proposal_knobs_url(@project, @proposal),
        notice: 'Knob was successfully created.'
    else
      render action: 'new'
    end
  end

  # GET projects/1/proposals/1/knobs/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @knob = @proposal.knobs.find(params[:id])
  end


  # PUT projects/1/proposals/1/knobs/1
  def update
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @knob = @proposal.knobs.find(params[:id])

    if @knob.update_attributes(params[:knob])
      redirect_to project_proposal_knobs_url(@project, @proposal),
        notice: 'Knob was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/proposals/1/knobs/1
  def destroy
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @knob = @proposal.knobs.find(params[:id])
    @knob.destroy

    redirect_to project_proposal_knobs_url
  end

  # GET projects/1/proposals/1/knobs/1
  # def show
  #   @knob = Knob.find(params[:id])
  # end
end
