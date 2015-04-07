class CreateFightQueues < ActiveRecord::Migration
  def change
    create_table :fight_queues do |t|
      t.references :game
      t.references :clearing
      t.integer :turn
      t.integer :fight_round
      t.string :state
    end
  end
end
