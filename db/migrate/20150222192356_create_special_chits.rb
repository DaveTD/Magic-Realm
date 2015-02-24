class CreateSpecialChits < ActiveRecord::Migration
  def change
    create_table :special_chits do |t|
      t.references :game, index: true
      t.references :tile, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
