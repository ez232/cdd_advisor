class TouchScreensController < ApplicationController
  # GET /touch_screens
  # GET /touch_screens.json
  def index
    @touch_screens = TouchScreen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @touch_screens }
    end
  end

  # GET /touch_screens/1
  # GET /touch_screens/1.json
  def show
    @touch_screen = TouchScreen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @touch_screen }
    end
  end

  # GET /touch_screens/new
  # GET /touch_screens/new.json
  def new
    @touch_screen = TouchScreen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @touch_screen }
    end
  end

  # GET /touch_screens/1/edit
  def edit
    @touch_screen = TouchScreen.find(params[:id])
  end

  # POST /touch_screens
  # POST /touch_screens.json
  def create
    @touch_screen = TouchScreen.new(params[:touch_screen])

    respond_to do |format|
      if @touch_screen.save
        format.html { redirect_to @touch_screen, notice: 'Touch screen was successfully created.' }
        format.json { render json: @touch_screen, status: :created, location: @touch_screen }
      else
        format.html { render action: "new" }
        format.json { render json: @touch_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /touch_screens/1
  # PUT /touch_screens/1.json
  def update
    @touch_screen = TouchScreen.find(params[:id])

    respond_to do |format|
      if @touch_screen.update_attributes(params[:touch_screen])
        format.html { redirect_to @touch_screen, notice: 'Touch screen was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @touch_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /touch_screens/1
  # DELETE /touch_screens/1.json
  def destroy
    @touch_screen = TouchScreen.find(params[:id])
    @touch_screen.destroy

    respond_to do |format|
      format.html { redirect_to touch_screens_url }
      format.json { head :no_content }
    end
  end
end
