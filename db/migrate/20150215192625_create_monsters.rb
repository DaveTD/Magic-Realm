class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.integer :damage_type
      t.integer :attack_time
      t.integer :maneuver_time
      t.integer :vulnerability
      t.integer :attacks
      t.references :clearing, index: true
      t.boolean :prowling

      t.timestamps null: false
    end
    add_foreign_key :monsters, :clearings
  end
end
