class Player < ActiveRecord::Base
  belongs_to :clearing
  belongs_to :action_queue
  belongs_to :weapon
  belongs_to :boots
  belongs_to :suit_of_armor
  belongs_to :shield
  belongs_to :helmet
  belongs_to :breast_plate
  belongs_to :horse
  belongs_to :hirelings
  belongs_to :curses
  belongs_to :character_class
  belongs_to :inventory
end
