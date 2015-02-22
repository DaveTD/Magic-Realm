class CreateArmors < ActiveRecord::Migration
  def change
    create_table :armors do |t|
      t.string :armor_name
      t.string :armor_type
      t.boolean :protect_thrust
      t.boolean :protect_swing
      t.boolean :protect_smash
      t.boolean :tremendous
      t.integer :price_intact
      t.integer :price_damaged
      t.integer :price_destroyed
      t.timestamps null: false
    end
  end
end
