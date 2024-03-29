class ButtonsController < ApplicationController
  # GET projects/1/proposals/1/buttons
  def index
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @buttons = @proposal.buttons
  end

  # GET projects/1/proposals/1/buttons/new
  def new
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @button = @proposal.buttons.build
  end

  # POST projects/1/proposals/1/buttons
  def create
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @button = @proposal.buttons.build(params[:button])

    if @button.save
      redirect_to project_proposal_buttons_url(@project, @proposal)
    else
      render action: 'new'
    end
  end

  # GET projects/1/proposals/1/buttons/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @button = @proposal.buttons.find(params[:id])
  end


  # PUT projects/1/proposals/1/buttons/1
  def update
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @button = @proposal.buttons.find(params[:id])

    if @button.update_attributes(params[:button])
      redirect_to correct_url(params)
    else
      render action: 'edit'
    end
  end

  # GET projects/1/proposals/1/buttons/1/recommendations
  def recommendations
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @button = @proposal.buttons.find(params[:id])
  end

  # DELETE projects/1/proposals/1/buttons/1
  def destroy
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @button = @proposal.buttons.find(params[:id])
    @button.destroy

    redirect_to project_proposal_buttons_url
  end

  # GET projects/1/proposals/1/buttons/1
  # def show
  #   @button = Button.find(params[:id])
  # end

  private
    def correct_url(params)
      case params.select{ |key| key =~ /action_/ }.first[0]
      when 'action_save_recommendations'
        results_project_url(@project,
                            tab: @project.proposals.index(@proposal))
      else
        project_proposal_buttons_url(@project, @proposal)
      end
    end
end
