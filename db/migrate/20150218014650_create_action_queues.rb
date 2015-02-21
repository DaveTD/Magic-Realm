class CreateActionQueues < ActiveRecord::Migration
  def change
    create_table :action_queues do |t|
      t.references :player, index: true
      t.string :action_name
      t.integer :value
      t.integer :turn
      t.integer :action_this_turn
      t.references :clearing, index: true

      t.timestamps null: false
    end
    add_foreign_key :action_queues, :players
    add_foreign_key :action_queues, :clearings
  end
end
