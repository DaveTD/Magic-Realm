class CreateDiscoveredChitsClearings < ActiveRecord::Migration
  def change
    create_table :discovered_chits_clearings do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.references :clearing, index: true

      t.timestamps null: false
    end
    add_foreign_key :discovered_chits_clearings, :players
    add_foreign_key :discovered_chits_clearings, :games
    add_foreign_key :discovered_chits_clearings, :clearings
  end
end
