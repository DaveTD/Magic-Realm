class Game < ActiveRecord::Base
  include AASM

  has_many :players

  after_create :card_setup
  after_initialize :init

  def init
    self.turn ||= 1
  end

  aasm do
    state :board_setup, :initial => true
    state :select_classes
    state :birdsong
    state :sunrise
    state :daylight
    state :sunset
    state :evening
    state :midnight

    event :board_complete do
      transitions :from => :board_setup, :to => :select_classes
    end

    event :players_ready do
      transitions :from => :select_classes, :to => :birdsong
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

    #event :everybody_died do

    #end
  end

  def aasm_state
    self.state || "unread"
  end

  def get_players
    players
  end

  def card_setup
  #   TreasureLocation.place_treasures(id)
  end

  def board_randomization
    players_ready!
  end

  def players_voted
    setup_complete!
  end

  def all_player_queues_submitted
    player_actions_subitted!
  end

  # player
  def check_votes
    all_ready = true
    all_players = Player.where(game_id: self.id)

    if all_players.count >= 2
      all_players.each do |player|
        all_ready &= player.ready
      end
    end

    if all_ready && all_players.count >= 2
      self.players_voted
    end
  end

  #player
  def actions_submitted
    all_submitted = true
    all_players = Player.where(game_id: self.id).where(dead: false)

    all_players.each do |player|
        all_submitted &= player.actions_submitted
    end

    if actions_submitted
      self.all_player_queues_submitted
    end

  end

  def select_player_order
    all_players = Player.where(game_id: self.id).where(dead: false)


  end
end
