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
end
