class OpeningDevicesController < ApplicationController
  # GET /opening_devices
  # GET /opening_devices.json
  def index
    @opening_devices = OpeningDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @opening_devices }
    end
  end

  # GET /opening_devices/1
  # GET /opening_devices/1.json
  def show
    @opening_device = OpeningDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @opening_device }
    end
  end

  # GET /opening_devices/new
  # GET /opening_devices/new.json
  def new
    @opening_device = OpeningDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @opening_device }
    end
  end

  # GET /opening_devices/1/edit
  def edit
    @opening_device = OpeningDevice.find(params[:id])
  end

  # POST /opening_devices
  # POST /opening_devices.json
  def create
    @opening_device = OpeningDevice.new(params[:opening_device])

    respond_to do |format|
      if @opening_device.save
        format.html { redirect_to @opening_device, notice: 'Opening device was successfully created.' }
        format.json { render json: @opening_device, status: :created, location: @opening_device }
      else
        format.html { render action: "new" }
        format.json { render json: @opening_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /opening_devices/1
  # PUT /opening_devices/1.json
  def update
    @opening_device = OpeningDevice.find(params[:id])

    respond_to do |format|
      if @opening_device.update_attributes(params[:opening_device])
        format.html { redirect_to @opening_device, notice: 'Opening device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @opening_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opening_devices/1
  # DELETE /opening_devices/1.json
  def destroy
    @opening_device = OpeningDevice.find(params[:id])
    @opening_device.destroy

    respond_to do |format|
      format.html { redirect_to opening_devices_url }
      format.json { head :no_content }
    end
  end
end
