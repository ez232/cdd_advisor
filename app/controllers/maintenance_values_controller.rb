class MaintenanceValuesController < ApplicationController
  # GET /maintenance_values
  # GET /maintenance_values.json
  def index
    @maintenance_values = MaintenanceValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintenance_values }
    end
  end

  # GET /maintenance_values/1
  # GET /maintenance_values/1.json
  def show
    @maintenance_value = MaintenanceValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maintenance_value }
    end
  end

  # GET /maintenance_values/new
  # GET /maintenance_values/new.json
  def new
    @maintenance_value = MaintenanceValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maintenance_value }
    end
  end

  # GET /maintenance_values/1/edit
  def edit
    @maintenance_value = MaintenanceValue.find(params[:id])
  end

  # POST /maintenance_values
  # POST /maintenance_values.json
  def create
    @maintenance_value = MaintenanceValue.new(params[:maintenance_value])

    respond_to do |format|
      if @maintenance_value.save
        format.html { redirect_to @maintenance_value, notice: 'Maintenance value was successfully created.' }
        format.json { render json: @maintenance_value, status: :created, location: @maintenance_value }
      else
        format.html { render action: "new" }
        format.json { render json: @maintenance_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maintenance_values/1
  # PUT /maintenance_values/1.json
  def update
    @maintenance_value = MaintenanceValue.find(params[:id])

    respond_to do |format|
      if @maintenance_value.update_attributes(params[:maintenance_value])
        format.html { redirect_to @maintenance_value, notice: 'Maintenance value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maintenance_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_values/1
  # DELETE /maintenance_values/1.json
  def destroy
    @maintenance_value = MaintenanceValue.find(params[:id])
    @maintenance_value.destroy

    respond_to do |format|
      format.html { redirect_to maintenance_values_url }
      format.json { head :no_content }
    end
  end
end
