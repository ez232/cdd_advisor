class FinishingValuesController < ApplicationController
  # GET /finishing_values
  # GET /finishing_values.json
  def index
    @finishing_values = FinishingValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finishing_values }
    end
  end

  # GET /finishing_values/1
  # GET /finishing_values/1.json
  def show
    @finishing_value = FinishingValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finishing_value }
    end
  end

  # GET /finishing_values/new
  # GET /finishing_values/new.json
  def new
    @finishing_value = FinishingValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finishing_value }
    end
  end

  # GET /finishing_values/1/edit
  def edit
    @finishing_value = FinishingValue.find(params[:id])
  end

  # POST /finishing_values
  # POST /finishing_values.json
  def create
    @finishing_value = FinishingValue.new(params[:finishing_value])

    respond_to do |format|
      if @finishing_value.save
        format.html { redirect_to @finishing_value, notice: 'Finishing value was successfully created.' }
        format.json { render json: @finishing_value, status: :created, location: @finishing_value }
      else
        format.html { render action: "new" }
        format.json { render json: @finishing_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finishing_values/1
  # PUT /finishing_values/1.json
  def update
    @finishing_value = FinishingValue.find(params[:id])

    respond_to do |format|
      if @finishing_value.update_attributes(params[:finishing_value])
        format.html { redirect_to @finishing_value, notice: 'Finishing value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finishing_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finishing_values/1
  # DELETE /finishing_values/1.json
  def destroy
    @finishing_value = FinishingValue.find(params[:id])
    @finishing_value.destroy

    respond_to do |format|
      format.html { redirect_to finishing_values_url }
      format.json { head :no_content }
    end
  end
end
