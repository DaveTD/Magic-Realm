class CreateActionQueues < ActiveRecord::Migration
  def change
    create_table :action_queues do |t|
      t.references :player, index: true
      t.text :action
      t.references :clearing, index: true

      t.timestamps null: false
    end
    add_foreign_key :action_queues, :players
    add_foreign_key :action_queues, :clearings
  end
end
