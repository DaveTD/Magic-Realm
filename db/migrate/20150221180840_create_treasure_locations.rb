class CreateTreasureLocations < ActiveRecord::Migration
  def change
    create_table :treasure_locations do |t|
      t.references :game, index: true
      t.references :treasure, index: true
      t.references :tile, index: true
      t.references :clearing, index: true
      t.boolean :lost_city
      t.boolean :lost_castle

      t.timestamps null: false
    end
  end
end
