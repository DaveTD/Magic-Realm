class TreasureLocation < ActiveRecord::Base
  belongs_to :game
  belongs_to :treasure
  belongs_to :tile
  belongs_to :clearing
end
