class CreateTankGasOverpressures < ActiveRecord::Migration[5.1]
  def change
    create_table :tank_gas_overpressures do |t|
      t.string :device_id
      t.decimal :sensor_reading
      t.datetime :timestamp

      t.timestamps
    end
  end
end
