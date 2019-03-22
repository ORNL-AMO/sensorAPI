class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    sensorType = params[:sensorType]
    id = params[:id]
    since = params[:since]

    table = getSensorTable(sensorType)
    return if table == nil

    data = table.where(["device_id = ? and timestamp > ?", id, since])

    respond_to do |format|
      format.json do
        render json: data
      end
    end
  end

  def create
    sensorType = params[:sensorType]
    id = params[:id]
    time = params[:timestamp]
    reading = [:sensorReading]

    table = getSensorTable(sensorType)
    return if table == nil

    table.create(device_id: id, timestamp: time, sensor_reading: reading)
  end

  def getSensorTable(sensorType)
    case sensorType
    when 'flow_rate'
      return FlowRate
    when 'pressure'
      # return Pressure
    else
      puts "Unrecognized sensor type: #{sensorType}"
      return nil
    end
  end
end
