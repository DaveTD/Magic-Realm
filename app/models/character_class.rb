class CharacterClass < ActiveRecord::Base
  belongs_to :ally
  belongs_to :friendly
  belongs_to :unfriendly
  belongs_to :enemy
  belongs_to :development_chits
  has_one :starting_weapon, class_name: "Weapon"
  has_one :starting_armor, class_name: "Armor"
  has_one :starting_helmet, class_name: "Armor"
  has_one :starting_shield, class_name: "Armor"
  has_one :starting_suit, class_name: "Armor" 
end
