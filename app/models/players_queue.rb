class PlayersQueue < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  after_initialize :init
  scope :incomplete -> {where(complete: false)}

  def init
    self.complete = false if complete.nil?
  end
end
