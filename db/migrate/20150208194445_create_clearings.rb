class CreateClearings < ActiveRecord::Migration
  def change
    create_table :clearings do |t|
      t.integer :x
      t.integer :y
      t.boolean :exit
      t.string :movement_type
      t.integer :movement_value
      t.integer :clearing_number
      t.references :tile
    end
  end
end
