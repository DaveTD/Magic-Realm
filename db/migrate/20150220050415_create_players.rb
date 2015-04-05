class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.references :game
      t.references :clearing, index: true
      t.boolean :ready
      t.boolean :actions_submitted
      t.integer :great_treasures_vps
      t.integer :usable_spells_vps
      t.integer :fame_vps
      t.integer :notoriety_vps
      t.integer :gold_vps
      t.integer :gold
      t.integer :fame
      t.integer :notoriety
      t.references :action_queue, index: true
      t.references :weapon, index: true
      t.boolean :weapon_alerted
      t.references :boots, index: true
      t.references :suit_of_armor, index: true
      t.references :shield, index: true
      t.references :helmet, index: true
      t.references :breast_plate, index: true
      t.references :horse, index: true
      t.references :hirelings, index: true
      t.boolean :hidden
      t.boolean :found_hidden_enemies
      t.integer :wounds
      t.integer :fatigue
      t.boolean :dead
      t.boolean :block
      t.references :character_class, index: true
      t.integer :level
      t.integer :between_clearing_1
      t.integer :between_clearing_2
      t.timestamps null: false
    end
  end
end
