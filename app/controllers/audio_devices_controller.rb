class AudioDevicesController < ApplicationController
  # GET /audio_devices
  # GET /audio_devices.json
  def index
    @audio_devices = AudioDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audio_devices }
    end
  end

  # GET /audio_devices/1
  # GET /audio_devices/1.json
  def show
    @audio_device = AudioDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @audio_device }
    end
  end

  # GET /audio_devices/new
  # GET /audio_devices/new.json
  def new
    @audio_device = AudioDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @audio_device }
    end
  end

  # GET /audio_devices/1/edit
  def edit
    @audio_device = AudioDevice.find(params[:id])
  end

  # POST /audio_devices
  # POST /audio_devices.json
  def create
    @audio_device = AudioDevice.new(params[:audio_device])

    respond_to do |format|
      if @audio_device.save
        format.html { redirect_to @audio_device, notice: 'Audio device was successfully created.' }
        format.json { render json: @audio_device, status: :created, location: @audio_device }
      else
        format.html { render action: "new" }
        format.json { render json: @audio_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /audio_devices/1
  # PUT /audio_devices/1.json
  def update
    @audio_device = AudioDevice.find(params[:id])

    respond_to do |format|
      if @audio_device.update_attributes(params[:audio_device])
        format.html { redirect_to @audio_device, notice: 'Audio device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @audio_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_devices/1
  # DELETE /audio_devices/1.json
  def destroy
    @audio_device = AudioDevice.find(params[:id])
    @audio_device.destroy

    respond_to do |format|
      format.html { redirect_to audio_devices_url }
      format.json { head :no_content }
    end
  end
end
