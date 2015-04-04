class Game < ActiveRecord::Base
  include AASM
  include ChitsetCreator
  include ChitSetup

  has_many :players
  has_many :notifications

  after_create :board_randomization
  after_create :init

  def init
    self.turn = 1
    self.prowling_row = 0
    save
  end

  aasm  :column => 'time_of_day' do
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

    event :player_actions_submitted do
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

  def init
    self.turn ||= 1
    #card_setup
    # we're going to have to set this up so that it creates all of its own chits
  end

  def get_players
    players
  end

  def board_randomization
    self.make_chits
    self.lost_c_setup
    self.treasure_chit_setup
    self.warning_chit_setup
    board_complete!
  end

  def players_voted
    players_ready!
  end

  def all_player_queues_submitted
    player_actions_submitted!
    select_action_order
    set_prowling_row
  end

  def set_prowling_row
    roll = Random.rand(1..6)
    self.prowling_row = roll
    self.save
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

    if all_ready
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
    if all_submitted
      self.all_player_queues_submitted
    end
  end

  def select_action_order
    all_players = Player.where(game_id: self.id).where(dead: false)
    all_players.shuffle.each_with_index do |player, i|
      PlayersQueue.create(game: self, player: player, turn_number: (i+1))
    end
    activity_order_selected!
    self.start_next_turn
  end

  def start_next_turn
    turn = PlayersQueue.where(game_id: self.id).incomplete.order('turn_number ASC').first
    unless turn
      denizen_actions_completed!
      self.current_players_turn = nil
      save
      self.go_to_bird_song
      return
    end
    self.current_players_turn = turn.player_id
    save
  end

  def create_denizens clearing_id
    # get the related tile to this clearing_id
    tile = Clearing.where(game_id: self.id).where(id: clearing_id).tile_id
    sound_chit_here = SoundChit.where(game_id: self.id).where(tile_id: tile)
    special_chit_here = SpecialChit.where(game_id: self.id).where(tile_id: tile)
    warning_chit_here = WarningChit.where(game_id: self.id).where(tile_id: tile)
    # check if there's anything for that sound, in the current prowling row
    unless sound_chit_here.empty?

    end
    unless special_chit_here.empty?

    end
    unless warning_chit_here.empty?

    end

  end

  def go_to_bird_song
    combat_completed!
    self.turn += 1
    save
    day_complete!
  end

  def determine_winner
    all_players = Player.where(game_id: self.id).where(dead: false)
  end
end
