class Clearing < ActiveRecord::Base
  belongs_to :tile
  has_many :traversable_clearings
end
