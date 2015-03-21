class CreateTreasureLocations < ActiveRecord::Migration
  def change
    create_table :treasure_locations do |t|
      t.references :game, index: true
      t.references :treasure, index: true
      t.references :clearing

      t.string :pile
      t.boolean :found

      t.timestamps null: false
    end
  end
end
