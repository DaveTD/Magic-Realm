class CreateClearings < ActiveRecord::Migration
  def change
    create_table :clearings do |t|
      t.integer :x_location
      t.integer :y_location
      t.integer :tile_number
      t.boolean :exit
      t.integer :type
      t.references :traversable_clearings, index: true

      t.timestamps null: false
    end
    add_foreign_key :clearings, :traversable_clearings
  end
end
