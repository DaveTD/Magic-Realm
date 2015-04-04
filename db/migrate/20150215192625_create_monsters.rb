class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.references :game, index: true
      t.string :monster
      t.integer :damage_type
      t.integer :attack_time
      t.integer :maneuver_time
      t.integer :vulnerability
      t.integer :attacks
      t.references :clearing, index: true
      t.boolean :prowling
      t.boolean :blocked
      t.integer :spawn_row
      t.boolean :hoard_appears
      t.boolean :lair_appears
      t.boolean :altar_appears
      t.boolean :shrine_appears
      t.boolean :pool_appears
      t.boolean :vault_appears
      t.boolean :cairns_appears
      t.boolean :statue_appears
      t.boolean :flutter_appears
      t.boolean :howl_appears
      t.boolean :patter_appears
      t.boolean :roar_appears
      t.boolean :slither_appears
      t.boolean :bones_appears
      t.boolean :dank_appears
      t.boolean :ruins_appears
      t.boolean :stink_appears
      t.boolean :smoke_appears

      t.boolean :m_appears
      t.boolean :v_appears
      t.boolean :w_appears
      t.boolean :c_appears

      t.integer :fame_reward
      t.integer :notoriety_reward
      t.integer :fatigue
      t.integer :wounds
      t.boolean :on_board
      t.boolean :dead
      t.string :monster_name

      t.timestamps null: false
    end
  end
end
