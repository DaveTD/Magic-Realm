class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.boolean :large
      t.integer :spell_type
      t.integer :fame_value
      t.boolean :great
      t.integer :fame_price_number
      t.string :enchanted
      t.integer :weight
      t.integer :notoriety_value
      t.integer :price
      t.boolean :metatreasure
      t.boolean :movable

      t.timestamps null: false
    end
  end
end
