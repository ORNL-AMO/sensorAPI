class SensorController < ApplicationController
  def show
    sensorType = params[:sensorType]
    id = params[:id]
    data = []
    r = Random.new
    data.push( { timestamp: Time.now, sensorReading: r.rand(500)/100.0})

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

    case sensorType
    when 'flow_rate'
      FlowRate.create(device_id: id, timestamp: time, sensorReading: reading)
    when 'pressure'
      # Pressure.create()
    else
      puts "Unrecognized sensor type: #{sensorType}"
    end
  end
end
