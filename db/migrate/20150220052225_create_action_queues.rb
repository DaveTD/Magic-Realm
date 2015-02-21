class CreateActionQueues < ActiveRecord::Migration
  def change
    create_table :action_queues do |t|
      t.references :player, index: true
      t.references :action_chit, index: true
      t.references :clearing, index: true

      t.timestamps null: false
    end
    add_foreign_key :action_queues, :players
    add_foreign_key :action_queues, :action_chits
    add_foreign_key :action_queues, :clearings
  end
end
