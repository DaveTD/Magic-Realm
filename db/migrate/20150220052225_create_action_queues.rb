class CreateActionQueues < ActiveRecord::Migration
  def change
    create_table :action_queues do |t|
      t.references :player, index: true
      t.string :action_name
      t.integer :value
      t.integer :turn
      t.integer :action_this_turn
      t.references :action_chit, index: true
      t.references :clearing, index: true
      t.boolean :completed

      t.timestamps null: false
    end
    add_foreign_key :action_queues, :players
    add_foreign_key :action_queues, :action_chits
    add_foreign_key :action_queues, :clearings
  end
end
