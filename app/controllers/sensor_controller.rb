class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    sensorType = params[:sensorType]
    id = params[:id]
    since = params[:since]
    if (since == nil)
      since = Time.now - (60 * 60 * 24)
    end

    table = getSensorTable(sensorType)
    if table == nil
      # raise ActionController::RoutingError.new('Unrecognized Sensor')
      # TODO remove this once testing is done
      r = Random.new
      data = [{sensor_reading: r.rand(500)/100.0 ,"timestamp": Time.now}]
    else
      data = table.where(["device_id = ? and timestamp > ?", id, since]).select("timestamp, sensor_reading")
    end

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
    reading = params[:sensorReading]

    table = getSensorTable(sensorType)
    return raise ActionController::RoutingError.new('Unrecognized Sensor') if table == nil

    table.create(device_id: id, timestamp: time, sensor_reading: reading.to_f)
  end

  def delete
    sensorType = params[:sensorType]
    id = params[:id]
    since = params[:since]

    table = getSensorTable(sensorType)
    return if table == nil

    # TODO add device table
    table.where(:device_id => id).destroy_all
  end

  def getSensorTable(sensorType)
    case sensorType.downcase()
    when 'flow_rate'
      return FlowRate
    when 'suction_pressure'
      return SuctionPressure
    when 'discharge_pressure'
      return DischargePressure
    when 'discharge_elevation'
      return DischargeElevation
    when 'tank_gas_overpressure'
      return TankGasOverpressure
    when 'tank_fluid_surface_elevation'
      return TankFluidSurfaceElevation
    else
      puts "Unrecognized sensor type: #{sensorType}"
      return nil
    end
  end
end
