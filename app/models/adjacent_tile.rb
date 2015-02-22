class AdjacentTile < ActiveRecord::Base
  belongs_to :tile
  belongs_to :next_tile, class_name: "Tile"
end
