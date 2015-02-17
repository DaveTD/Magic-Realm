class CreateNatives < ActiveRecord::Migration
  def change
    create_table :natives do |t|
      t.text :type
      t.boolean :hq
      t.integer :harm_type
      t.integer :attack_time
      t.boolean :sharpness
      t.integer :maneuver_time

      t.timestamps null: false
    end
  end
end
