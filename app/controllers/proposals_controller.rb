class ProposalsController < ApplicationController
  # GET project/1/proposals
  def index
    @project = Project.find(params[:project_id])
    @proposals = @project.proposals
  end

  # GET project/1/proposals/new
  def new
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.build
  end

  # POST project/1/proposals
  def create
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.build(params[:proposal])

    if @proposal.save
      redirect_to correct_url(params)
    else
      render action: 'new'
    end
  end

  # GET project/1/proposals/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:id])
  end

  # GET project/1/proposals/1/edit_other_attributes
  def edit_other_attributes
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:id])
  end

  # PUT project/1/proposals/1
  def update
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:id])

    logger.warn('**********')
    logger.warn(params[:proposal])
    logger.warn('**********')
    if @proposal.update_attributes(params[:proposal])
      redirect_to correct_url(params)
    else
      render action: 'edit'
    end
  end

  # GET project/1/proposals/1
  # def show
  #   @proposal = Proposal.find(params[:id])
  # end

  # DELETE project/1/proposals/1
  # def destroy
  #   @proposal = Proposal.find(params[:id])
  #   @proposal.destroy

  #   redirect_to proposals_url
  # end

  private
    def correct_url(params)
      case params.select{ |key| key =~ /action_/ }.first[0]
      when 'action_save'
        project_proposals_url(@project)
      when 'action_labels'
        project_proposal_labels_url(@project, @proposal)
      when 'action_handles'
        project_proposal_handles_url(@project, @proposal)
      when 'action_switches'
        project_proposal_switches_url(@project, @proposal)
      when 'action_knobs'
        project_proposal_knobs_url(@project, @proposal)
      when 'action_buttons'
        project_proposal_buttons_url(@project, @proposal)
      when 'action_other_attributes'
        edit_other_attributes_project_proposal_url(@project, @proposal)
      when 'action_edit_other_attributes'
        edit_project_proposal_path(@project, @proposal)
      else
        project_proposals_url(@project)
      end
    end
end
