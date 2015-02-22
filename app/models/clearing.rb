class Clearing < ActiveRecord::Base
  belongs_to :tile
  has_many :traversable_clearings
  scope :not_cave, -> {where('movement_type IS NOT ?', 'cave')}

  def wood?
    self.movement_type == 'wood'
  end
  def mountain?
    self.movement_type == 'mountain'
  end
  def cave?
    self.movement_type == 'cave'
  end
end
