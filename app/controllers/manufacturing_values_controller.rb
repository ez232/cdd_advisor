class ManufacturingValuesController < ApplicationController
  # GET /manufacturing_values
  # GET /manufacturing_values.json
  def index
    @manufacturing_values = ManufacturingValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manufacturing_values }
    end
  end

  # GET /manufacturing_values/1
  # GET /manufacturing_values/1.json
  def show
    @manufacturing_value = ManufacturingValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manufacturing_value }
    end
  end

  # GET /manufacturing_values/new
  # GET /manufacturing_values/new.json
  def new
    @manufacturing_value = ManufacturingValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manufacturing_value }
    end
  end

  # GET /manufacturing_values/1/edit
  def edit
    @manufacturing_value = ManufacturingValue.find(params[:id])
  end

  # POST /manufacturing_values
  # POST /manufacturing_values.json
  def create
    @manufacturing_value = ManufacturingValue.new(params[:manufacturing_value])

    respond_to do |format|
      if @manufacturing_value.save
        format.html { redirect_to @manufacturing_value, notice: 'Manufactoring value was successfully created.' }
        format.json { render json: @manufacturing_value, status: :created, location: @manufacturing_value }
      else
        format.html { render action: "new" }
        format.json { render json: @manufacturing_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manufacturing_values/1
  # PUT /manufacturing_values/1.json
  def update
    @manufacturing_value = ManufacturingValue.find(params[:id])

    respond_to do |format|
      if @manufacturing_value.update_attributes(params[:manufacturing_value])
        format.html { redirect_to @manufacturing_value, notice: 'Manufactoring value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manufacturing_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturing_values/1
  # DELETE /manufacturing_values/1.json
  def destroy
    @manufacturing_value = ManufacturingValue.find(params[:id])
    @manufacturing_value.destroy

    respond_to do |format|
      format.html { redirect_to manufacturing_values_url }
      format.json { head :no_content }
    end
  end
end
