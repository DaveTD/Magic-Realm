class Clearing < ActiveRecord::Base
  belongs_to :tile
  has_many :traversable_clearings
  scope :not_cave, -> {where('movement_type != ?', 'cave')}
  scope :not_exit, -> {where('exit != ?', true)}

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
