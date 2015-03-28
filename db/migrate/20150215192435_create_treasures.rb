class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.references :game, index: true
      t.string :name
      t.boolean :large
      t.string :spell_type
      t.integer :fame_value
      t.boolean :great
      t.integer :fame_price_number
      t.string :enchanted
      t.string :weight
      t.integer :notoriety_value
      t.integer :price
      t.boolean :metatreasure
      t.boolean :movable
      t.string :pile

      t.timestamps null: false
    end
  end
end
