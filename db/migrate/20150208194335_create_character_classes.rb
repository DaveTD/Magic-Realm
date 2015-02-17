class CreateCharacterClasses < ActiveRecord::Migration
  def change
    create_table :character_classes do |t|
      t.integer :vunlerability
      t.integer :movement_cost
      t.integer :cave_movement_cost
      t.integer :mountain_movement_cost
      t.references :ally, index: true
      t.references :friendly, index: true
      t.references :unfriendly, index: true
      t.references :enemy, index: true
      t.references :development_chits, index: true
      t.text :special_advantages
      t.integer :starts_in
      t.integer :base_rest_phases

      t.timestamps null: false
    end
    add_foreign_key :character_classes, :allies
    add_foreign_key :character_classes, :friendlies
    add_foreign_key :character_classes, :unfriendlies
    add_foreign_key :character_classes, :enemies
    add_foreign_key :character_classes, :development_chits
  end
end
