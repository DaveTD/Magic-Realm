class AdjacentTile < ActiveRecord::Base
  belongs_to :tile
  belongs_to :Adjacent_tile, class_name: "Tile"
end
