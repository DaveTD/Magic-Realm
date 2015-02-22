class CreatePlayersQueues < ActiveRecord::Migration
  def change
    create_table :players_queues do |t|
      t.references :game
      t.references :player
      t.integer :turn_number
      t.boolean :complete
      t.timestamps null: false
    end
  end
end
