class SpecialChit < ActiveRecord::Base
  belongs_to :game
  belongs_to :tile
end
