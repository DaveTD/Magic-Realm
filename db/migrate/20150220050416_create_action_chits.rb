class CreateActionChits < ActiveRecord::Migration
  def change
    create_table :action_chits do |t|
      t.references :player, index: true
      t.text :type
      t.integer :strength

      t.timestamps null: false
    end
    add_foreign_key :action_chits, :players
  end
end
