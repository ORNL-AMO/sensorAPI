class DeviceController < ApplicationController
  skip_before_action :verify_authenticity_token

  # create a new device in db and return it's id
  def create
    puts "creating new device"
    deviceName = params[:device_name]
    deviceType = params[:type]

    newDevice = Device.create(device_name: deviceName, type: deviceType)

    respond_to do |format|
      format.json do
        render json: { device_id: newDevice.id}
      end
    end
  end

  # delete device with id = params[:device_id]
  def delete
  end

  # return a list of devices
  # [{:device_id, :device_name, :device_type}, ...]
  def index
  end

  # return a specific device's information
  def show
  end
end
