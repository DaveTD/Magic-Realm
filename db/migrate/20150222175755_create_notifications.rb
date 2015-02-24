class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.string :action
      t.boolean :private_notification
      t.boolean :shown
      t.integer :turn

      t.timestamps null: false
    end
  end
end
