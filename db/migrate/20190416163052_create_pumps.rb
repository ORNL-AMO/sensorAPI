class CreatePumps < ActiveRecord::Migration[5.1]
  def change
    create_table :pumps do |t|
      t.text :data

      belongs_to :device
      t.timestamps
    end
  end
end
