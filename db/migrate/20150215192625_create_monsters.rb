class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :monster
      t.integer :damage_type
      t.integer :attack_time
      t.integer :maneuver_time
      t.integer :vulnerability
      t.integer :attacks
      t.references :clearing, index: true
      t.boolean :prowling
      t.boolean :blocked
      t.string :monster_name

      t.timestamps null: false
    end
  end
end
