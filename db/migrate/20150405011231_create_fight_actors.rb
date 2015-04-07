class CreateFightActors < ActiveRecord::Migration
  def change
    create_table :fight_actors do |t|
      t.references :game
      t.references :player
      t.references :monster
      t.references :fight_queue
      t.string :state
      t.boolean :dead
      t.integer :turn
    end
  end
end
