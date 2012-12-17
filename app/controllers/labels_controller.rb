class LabelsController < ApplicationController
  # GET projects/1/proposals/1/labels
  def index
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @labels = @proposal.labels
  end

  # GET projects/1/proposals/1/labels/new
  def new
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @label = @proposal.labels.build
  end

  # POST projects/1/proposals/1/labels
  def create
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @label = @proposal.labels.build(params[:label])

    if @label.save
      redirect_to project_proposal_labels_url(@project, @proposal)
    else
      render action: 'new'
    end
  end

  # GET projects/1/proposals/1/labels/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @label = @proposal.labels.find(params[:id])
  end


  # PUT projects/1/proposals/1/labels/1
  def update
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @label = @proposal.labels.find(params[:id])

    if @label.update_attributes(params[:label])
      redirect_to correct_url(params)
    else
      render action: 'edit'
    end
  end

  # GET projects/1/proposals/1/labels/1/recommendations
  def recommendations
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @label = @proposal.labels.find(params[:id])
  end

  # DELETE projects/1/proposals/1/labels/1
  def destroy
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:proposal_id])
    @label = @proposal.labels.find(params[:id])
    @label.destroy

    redirect_to project_proposal_labels_url
  end

  # GET projects/1/proposals/1/labels/1
  # def show
  #   @label = Label.find(params[:id])
  # end

  private
    def correct_url(params)
      case params.select{ |key| key =~ /action_/ }.first[0]
      when 'action_save_recommendations'
        results_project_url(@project,
                            tab: @project.proposals.index(@proposal))
      else
        project_proposal_labels_url(@project, @proposal)
      end
    end
end
