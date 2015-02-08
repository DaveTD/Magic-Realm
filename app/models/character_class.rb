class CharacterClass < ActiveRecord::Base
  belongs_to :ally
  belongs_to :friendly
  belongs_to :unfriendly
  belongs_to :enemy
  belongs_to :development_chits
end
