class Monster < ActiveRecord::Base
  belongs_to :game
  belongs_to :clearing

  after_create :init

  def init
    self.wounds = 0
    self.fatigue = 0
    save
  end

  def wound!(results)
    self.wounds += results[:wounds]
    self.fatigue += results[:fatigue]
    if ((self.wounds*2) + self.fatigue) >= self.vulnerability
      self.dead = true
    end
    save
  end
end
