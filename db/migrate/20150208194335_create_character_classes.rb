class CreateCharacterClasses < ActiveRecord::Migration
  def change
    create_table :character_classes do |t|
      t.string :name
      t.integer :vulnerability
      t.integer :movement_cost
      t.integer :cave_movement_cost
      t.integer :mountain_movement_cost
      t.references :ally, index: true
      t.references :friendly, index: true
      t.references :unfriendly, index: true
      t.references :enemy, index: true
      t.references :development_chits, index: true

      t.references :starting_weapon
      t.references :starting_shield
      t.references :starting_helmet
      t.references :starting_breastplate
      t.references :starting_suit

      t.text :special_advantages
      t.integer :starts_in
      t.integer :starting_gold

      t.timestamps null: false
    end
  end
end
