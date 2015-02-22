class CreateTile < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :name
      t.string :tile_type
    end
  end
end
