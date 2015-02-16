class Game < ActiveRecord::Base
  include AASM

  aasm do
    state :gameSetup, :initial => true
    state :boardSetup,
    state :selectClasses,
    state :mapReveal.

    state :birdsong,
    state :sunrise,
    state :daylight,
    state :sunset,
    state :evening,
    state :midnight

    event :cards_randomized do
      transitions :from => :gameSetup, :to => :boardSetup
    end

    event :board_complete do
      transitions :from => :boardSetup, :to => :selectClasses
    end

    event :players_ready do
      transitions :from => :selectClasses, :to => :mapReveal
    end

    event :setup_complete do
      transitions :from => :mapReveal, :to => :birdsong
    end

    event :player_actions_subitted do
      transitions :from => :birdsong, :to => :sunrise
    end

    event :activity_order_selected do
      transitions :from => :sunrise, :to => :daylight
    end

    event :denizen_actions_completed do
      transitions :from => :daylight, :to => :evening
    end

    event :combat_completed do
      transitions :from => :evening, :to => :midnight
    end

    event :day_complete do
      transitions :from => :midnight, :to => :birdsong
    end


  end

end
