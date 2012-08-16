class ScreensController < ApplicationController
  # GET /screens
  # GET /screens.json
  def index
    @screens = Screen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @screens }
    end
  end

  # GET /screens/1
  # GET /screens/1.json
  def show
    @screen = Screen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @screen }
    end
  end

  # GET /screens/new
  # GET /screens/new.json
  def new
    @screen = Screen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @screen }
    end
  end

  # GET /screens/1/edit
  def edit
    @screen = Screen.find(params[:id])
  end

  # POST /screens
  # POST /screens.json
  def create
    @screen = Screen.new(params[:screen])

    respond_to do |format|
      if @screen.save
        format.html { redirect_to @screen, notice: 'Screen was successfully created.' }
        format.json { render json: @screen, status: :created, location: @screen }
      else
        format.html { render action: "new" }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /screens/1
  # PUT /screens/1.json
  def update
    @screen = Screen.find(params[:id])

    respond_to do |format|
      if @screen.update_attributes(params[:screen])
        format.html { redirect_to @screen, notice: 'Screen was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screens/1
  # DELETE /screens/1.json
  def destroy
    @screen = Screen.find(params[:id])
    @screen.destroy

    respond_to do |format|
      format.html { redirect_to screens_url }
      format.json { head :no_content }
    end
  end
end
