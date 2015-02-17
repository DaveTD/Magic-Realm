class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.integer :move_strength
      t.boolean :galloping
      t.integer :maneuver_time

      t.timestamps null: false
    end
  end
end
