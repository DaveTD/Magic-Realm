class Game < ActiveRecord::Base
  include AASM

  has_many :players

  aasm do
    state :game_setup, :initial => true
    state :board_setup
    state :select_classes
    state :map_reveal
    state :birdsong
    state :sunrise
    state :daylight
    state :sunset
    state :evening
    state :midnight

    event :cards_randomized do
      transitions :from => :game_setup, :to => :board_setup
    end

    event :board_complete do
      transitions :from => :board_setup, :to => :select_classes
    end

    event :players_ready do
      transitions :from => :select_classes, :to => :map_reveal
    end

    event :setup_complete do
      transitions :from => :map_reveal, :to => :birdsong
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

  def aasm_state
    self.state || "unread"
  end

  def get_players
    players
  end
end
