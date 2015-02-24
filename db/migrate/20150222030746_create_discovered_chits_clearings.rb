class CreateDiscoveredChitsClearings < ActiveRecord::Migration
  def change
    create_table :discovered_chits_clearings do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.references :clearing, index: true

      t.timestamps null: false
    end
  end
end
