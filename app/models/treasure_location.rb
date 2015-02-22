class TreasureLocation < ActiveRecord::Base
  belongs_to :game
  belongs_to :treasure
  belongs_to :tile
  belongs_to :clearing

  def self.place_treasures(game_id)

    all_treasures = Treasure.all
    all_treasures.each do |treasure|
      # pick tile
      # pick clearing
      # pick lost city
      # pick lost castle

      TreasureLocation.create(game_id: game_id, tile: tile ...)
    end
  end

end
