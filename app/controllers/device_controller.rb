require 'json'

class DeviceController < ApplicationController
  skip_before_action :verify_authenticity_token

  # create a new device in db and return it's id
  def create
    puts "creating new device"
    deviceName = params[:device_name]
    deviceType = params[:type]
    data = params[:data]

    newDevice = Device.create(device_name: deviceName, device_type: deviceType, data: data.to_json)
  end

  # delete device with id = params[:device_id]
  def delete
    Device.find(params[:device_id]).destroy
  end

  # return a list of devices
  # [{:device_id, :device_name, :device_type}, ...]
  def index
    devices = Device.all

    respond_to do |format|
      format.json do
        render json: devices
      end
    end
  end

  def update
    puts "updating a device"
    device = Device.find(params[:device_id])
    device.data = params[:data].to_json
    device.save
  end

  # return a specific device's information
  def show
    device = Device.find(params[:device_id])

    respond_to do |format|
      format.json do
        render json: device
      end
    end
  end
end
