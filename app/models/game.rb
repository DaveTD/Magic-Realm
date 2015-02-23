class Game < ActiveRecord::Base
  include AASM

  has_many :players
  has_many :notifications

  after_create :board_randomization
  after_initialize :init

  def init
    self.turn ||= 1
    card_setup
    # we're going to have to set this up so that it creates all of its own chits
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
    all_treasure_site_chits = GoldSite.all

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
    self.card_setup
    board_complete!
  end

  def players_voted
    players_ready!
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

  def lost_items
    @lost_city_tile = SpecialChit.where(name: 'Lost City').tile
    @lost_castle_tile = SpecialChit.where(name: 'Lost Castle').tile

    @lost_city_pile_sounds = SoundChit.where(lost_city: true)
    @lost_castle_pile_sounds = SoundChit.where(lost_castle: true)
    @lost_city_pile_treasures = GoldSite.where(lost_city: true)
    @lost_castle_pile_treasures = GoldSite.where(lost_castle: true)

    @lost_city_tile_sounds = SoundChit.where(tile: @lost_city_tile)
    @lost_castle_tile_sounds = SoundChit.where(tile: @lost_castle_tile)
    @lost_city_tile_treasures = GoldSite.where(tile: @lost_city_tile)
    @lost_castle_tile_treasures = GoldSite.where(tile: @lost_castle_tile)

    render 'lost_items'
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
    turn = PlayersQueue.where(game_id: id).incomplete.order('turn_number ASC').first
    unless turn
      denizen_actions_completed!
    end
    self.current_players_turn = turn.player_id
    save
  end
end
