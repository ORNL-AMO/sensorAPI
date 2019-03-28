class CreateDischargeElevations < ActiveRecord::Migration[5.1]
  def change
    create_table :discharge_elevations do |t|
      t.string :device_id
      t.decimal :sensor_reading
      t.datetime :timestamp

      t.timestamps
    end
  end
end
