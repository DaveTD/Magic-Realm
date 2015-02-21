class Clearing < ActiveRecord::Base
  belongs_to :tile
  has_many :traversable_clearings

  def wood?
    self.movement_type == 'wood'
  end
  def moutain?
    self.movement_type == 'moutain'
  end
  def cave?
    self.movement_type == 'cave'
  end
end
