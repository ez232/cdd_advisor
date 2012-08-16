class KnobsController < ApplicationController
  # GET /knobs
  # GET /knobs.json
  def index
    @knobs = Knob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @knobs }
    end
  end

  # GET /knobs/1
  # GET /knobs/1.json
  def show
    @knob = Knob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @knob }
    end
  end

  # GET /knobs/new
  # GET /knobs/new.json
  def new
    @knob = Knob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @knob }
    end
  end

  # GET /knobs/1/edit
  def edit
    @knob = Knob.find(params[:id])
  end

  # POST /knobs
  # POST /knobs.json
  def create
    @knob = Knob.new(params[:knob])

    respond_to do |format|
      if @knob.save
        format.html { redirect_to @knob, notice: 'Knob was successfully created.' }
        format.json { render json: @knob, status: :created, location: @knob }
      else
        format.html { render action: "new" }
        format.json { render json: @knob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /knobs/1
  # PUT /knobs/1.json
  def update
    @knob = Knob.find(params[:id])

    respond_to do |format|
      if @knob.update_attributes(params[:knob])
        format.html { redirect_to @knob, notice: 'Knob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @knob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knobs/1
  # DELETE /knobs/1.json
  def destroy
    @knob = Knob.find(params[:id])
    @knob.destroy

    respond_to do |format|
      format.html { redirect_to knobs_url }
      format.json { head :no_content }
    end
  end
end
