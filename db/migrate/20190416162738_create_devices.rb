class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :nickname
      t.string :type

      t.timestamps
    end
  end
end
