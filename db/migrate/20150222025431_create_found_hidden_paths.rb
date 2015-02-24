class CreateFoundHiddenPaths < ActiveRecord::Migration
  def change
    create_table :found_hidden_paths do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.references :clearing, index: true

      t.timestamps null: false
    end
  end
end
