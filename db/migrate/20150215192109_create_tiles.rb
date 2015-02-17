class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :name
      t.references :clearings, index: true

      t.timestamps null: false
    end
    add_foreign_key :tiles, :clearings
  end
end
