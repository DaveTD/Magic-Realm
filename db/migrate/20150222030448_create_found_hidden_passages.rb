class CreateFoundHiddenPassages < ActiveRecord::Migration
  def change
    create_table :found_hidden_passages do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.references :clearing, index: true

      t.timestamps null: false
    end
    add_foreign_key :found_hidden_passages, :players
    add_foreign_key :found_hidden_passages, :games
    add_foreign_key :found_hidden_passages, :clearings
  end
end
