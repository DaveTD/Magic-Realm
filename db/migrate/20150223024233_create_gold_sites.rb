class CreateGoldSites < ActiveRecord::Migration
  def change
    create_table :gold_sites do |t|
      t.references :game, index: true
      t.references :tile, index: true
      t.boolean :lost_city
      t.boolean :lost_castle
      t.string :name
      t.integer :tile_clearing_number

      t.timestamps null: false
    end
    add_foreign_key :gold_sites, :games
    add_foreign_key :gold_sites, :tiles
  end
end
