class CreateFoundHiddenPaths < ActiveRecord::Migration
  def change
    create_table :found_hidden_paths do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.references :clearing, index: true

      t.timestamps null: false
    end
    add_foreign_key :found_hidden_paths, :players
    add_foreign_key :found_hidden_paths, :games
    add_foreign_key :found_hidden_paths, :clearings
  end
end
