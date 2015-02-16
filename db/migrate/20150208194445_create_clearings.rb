class CreateClearings < ActiveRecord::Migration
  def change
    create_table :clearings do |t|
      t.integer :x-location
      t.integer :y-location
      t.integer :tile-number
      t.boolean :exit
      t.integer :type
      t.references :traversable_clearings, index: true

      t.timestamps null: false
    end
    add_foreign_key :clearings, :traversable_clearings
  end
end
