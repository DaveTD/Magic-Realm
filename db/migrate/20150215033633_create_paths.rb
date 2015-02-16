class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.references :clearing_1, index: true
      t.references :clearing_2, index: true
      t.boolean :hidden

      t.timestamps null: false
    end
    add_foreign_key :paths, :clearing_1s
    add_foreign_key :paths, :clearing_2s
  end
end
