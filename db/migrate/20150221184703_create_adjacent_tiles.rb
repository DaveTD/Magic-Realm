class CreateAdjacentTiles < ActiveRecord::Migration
  def change
    create_table :adjacent_tiles do |t|
    	t.references :tile
      	t.references :adjacent_tile
      	t.string :location
    end
  end
end