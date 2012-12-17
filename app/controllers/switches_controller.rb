class SwitchesController < ApplicationController
  # GET projects/1/proposals/1projects/1/proposals/1/switches
  def index
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @switches = @proposal.switches
  end

  # GET projects/1/proposals/1/switches/new
  def new
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @switch = @proposal.switches.build
  end

  # POST projects/1/proposals/1/switches
  def create
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @switch = @proposal.switches.build(params[:switch])

    if @switch.save
      redirect_to project_proposal_switches_url(@project, @proposal)
    else
      render action: 'new'
    end
  end

  # GET projects/1/proposals/1/switches/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @switch = @proposal.switches.find(params[:id])
  end

  # PUT projects/1/proposals/1/switches/1
  def update
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @switch = @proposal.switches.find(params[:id])

    if @switch.update_attributes(params[:switch])
      redirect_to correct_url(params)
    else
      render action: 'edit'
    end
  end

  # GET projects/1/proposals/1/switches/1/recommendations
  def recommendations
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @switch = @proposal.switches.find(params[:id])
  end

  # DELETE projects/1/proposals/1/switches/1
  def destroy
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @switch = @proposal.switches.find(params[:id])
    @switch.destroy

    redirect_to project_proposal_switches_url
  end

  # GET projects/1/proposals/1/switches/1
  # def show
  #   @switch = Switch.find(params[:id])
  # end

  private
    def correct_url(params)
      case params.select{ |key| key =~ /action_/ }.first[0]
      when 'action_save_recommendations'
        results_project_url(@project,
                            tab: @project.proposals.index(@proposal))
      else
        project_proposal_switches_url(@project, @proposal)
      end
    end
end
