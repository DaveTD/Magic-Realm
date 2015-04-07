class CreateFightActions < ActiveRecord::Migration
  def change
    create_table :fight_actions do |t|
      t.string :attack
      t.string :defence
      t.references :fight_queue
      t.references :fight_actor
      t.references :target
      t.integer :fight_round
      t.boolean :complete
    end
  end
end
