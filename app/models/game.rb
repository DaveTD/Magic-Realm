class Game < ActiveRecord::Base
  include AASM

  has_many :players

  after_create :card_setup
  after_initialize :init

  def init
    self.turn ||= 1
    card_setup
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

  def get_players
    players
  end

  def card_setup
    all_cave_tiles = Tile.where(tile_type: 'cave')
    all_mountain_tiles = Tile.where(tile_type: 'mountain')

    all_sound_chits = SoundChit.all
    #all_warning_chits = WarningChit.all
    all_treasure_site_chits = TreasureLocation.all

    chit_mixer = all_sound_chits + all_treasure_site_chits
    lost_city_pile = chit_mixer.sample(5)
    chit_mixer = chit_mixer - lost_city_pile
    lost_castle_pile = chit_mixer.sample(5)
    chit_mixer = chit_mixer - lost_castle_pile

    cave_tile_set = chit_mixer.sample(4)
    chit_mixer = chit_mixer - cave_tile_set
    mountain_tile_set = chit_mixer
    chit_mixer = nil

    mountain_tile_set = mountain_tile_set << SpecialChit.where(name: 'Lost Castle')
    cave_tile_set = cave_tile_set << SpecialChit.where(name: 'Lost City')

    lost_city_pile = lost_city_pile.shuffle
    lost_castle_pile = lost_castle_pile.shuffle
    mountain_tile_set = mountain_tile_set.shuffle
    cave_tile_set = cave_tile_set.shuffle

    lost_city_pile.each do |chit|
      chit.lost_city = true
      chit.save
    end

    lost_castle_pile.each do |chit|
      chit.lost_castle = true
      chit.save
    end

    mountain_tile_set.each do |chit|
      chit.tile = all_mountain_tiles.shift
      chit.save
    end

    cave_tile_set.each do |chit|
      chit.tile = all_cave_tiles.shift
      chit.save
    end
  end

  def board_randomization
    players_ready!
  end

  def players_voted
    setup_complete!
  end

  def all_player_queues_submitted
    player_actions_submitted!
    select_action_order
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

    if all_submitted
      self.all_player_queues_submitted
    end

  end

  def select_action_order
    all_players = Player.where(game_id: self.id).where(dead: false)
    all_players.shuffle.each_with_index do |player, i|
      PlayerQueue.create(game: self, player: player, turn_number: (i+1))
    end
    activity_order_selected!
  end
end
