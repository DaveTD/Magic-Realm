class Tile < ActiveRecord::Base
  has_many :clearings
  has_many :adjacent_tiles
end
