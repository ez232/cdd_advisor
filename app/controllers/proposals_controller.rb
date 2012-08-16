class ProposalsController < ApplicationController
  before_filter :check_current_project

  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = @project.proposals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proposals }
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.json
  def new
    @proposal = Proposal.new
    @proposal.build_handle
    @proposal.build_switch
    @proposal.build_knob
    @proposal.build_button

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(params[:proposal])
    @project.proposals << @proposal

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to proposals_url }
        format.json { render json: @proposal, status: :created, 
          location: @proposal }
      else
        format.html { render action: "new" }
        format.json { render json: @proposal.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.json
  def update
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        format.html { redirect_to proposals_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proposal.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to proposals_url }
      format.json { head :no_content }
    end
  end

  protected
    def check_current_project
      if current_project.nil?
        redirect_to projects_url
      else
        @project = current_project
      end 
    end
end
