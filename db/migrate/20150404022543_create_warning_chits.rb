class CreateWarningChits < ActiveRecord::Migration
  def change
    create_table :warning_chits do |t|
      t.references :game, index: true
      t.string :name
      t.string :letter
      t.references :tile, index: true

      t.timestamps null: false
    end
  end
end
