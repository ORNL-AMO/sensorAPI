class CreatePumps < ActiveRecord::Migration[5.1]
  def change
    create_table :pumps do |t|
      t.integer :device_id
      t.text :data

      t.timestamps
    end
  end
end
