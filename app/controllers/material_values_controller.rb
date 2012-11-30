class MaterialValuesController < ApplicationController
  # GET /material_values
  # GET /material_values.json
  def index
    @material_values = MaterialValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_values }
    end
  end

  # GET /material_values/1
  # GET /material_values/1.json
  def show
    @material_value = MaterialValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_value }
    end
  end

  # GET /material_values/new
  # GET /material_values/new.json
  def new
    @material_value = MaterialValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_value }
    end
  end

  # GET /material_values/1/edit
  def edit
    @material_value = MaterialValue.find(params[:id])
  end

  # POST /material_values
  # POST /material_values.json
  def create
    @material_value = MaterialValue.new(params[:material_value])

    respond_to do |format|
      if @material_value.save
        format.html { redirect_to @material_value, notice: 'Material value was successfully created.' }
        format.json { render json: @material_value, status: :created, location: @material_value }
      else
        format.html { render action: "new" }
        format.json { render json: @material_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /material_values/1
  # PUT /material_values/1.json
  def update
    @material_value = MaterialValue.find(params[:id])

    respond_to do |format|
      if @material_value.update_attributes(params[:material_value])
        format.html { redirect_to @material_value, notice: 'Material value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_values/1
  # DELETE /material_values/1.json
  def destroy
    @material_value = MaterialValue.find(params[:id])
    @material_value.destroy

    respond_to do |format|
      format.html { redirect_to material_values_url }
      format.json { head :no_content }
    end
  end
end
