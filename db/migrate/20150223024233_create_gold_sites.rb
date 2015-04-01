class CreateGoldSites < ActiveRecord::Migration
  def change
    create_table :gold_sites do |t|
      t.references :game, index: true
      t.references :tile, index: true
      t.references :clearing, index: true
      t.boolean :lost_city
      t.boolean :lost_castle
      t.string :site_name
      t.integer :tile_clearing_number

      t.timestamps null: false
    end
  end
end
