class CreateMotorPowers < ActiveRecord::Migration[5.1]
  def change
    create_table :motor_powers do |t|
      t.integer :device_id, index: true
      t.decimal :sensor_reading
      t.datetime :timestamp

      t.timestamps
    end
  end
end
