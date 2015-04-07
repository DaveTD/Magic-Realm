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
    self.name ||= "generated game"
    self.complete ||= false
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
    else
      all_ready = false
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

  def create_denizens clearing_id, player_id
    # get the related tile to this clearing_id
    tile = Clearing.find(clearing_id).tile_id
    sound_chits_here = SoundChit.where(game_id: self.id).where(tile_id: tile)
    gold_sites_here = GoldSite.where(game_id: self.id).where(tile_id: tile)
    warning_chits_here = WarningChit.where(game_id: self.id).where(tile_id: tile)
    # check if there's anything for that sound, in the current prowling row
    unless sound_chits_here.empty?
      sound_chits_here.each do |sound_chit|
        record(player_id, "Player #{player_id} hears a #{sound_chit.name.downcase}!", false)
        sound_appears = sound_chit.name.downcase + "_appears"
        tile_appears = Tile.where(id: sound_chit.tile_id).first.tile_type[0] + "_appears"

        appearing_monster_name = Monster.where(game_id: self.id).where("#{tile_appears} IS 't' AND #{sound_appears} IS 't'").where(dead: false).where(on_board: false).where(spawn_row: self.spawn_row).first.monster
        unless appearing_monster_name.empty?
          if appearing_monster_name.include? "Goblin"
            appearing_monster_name.slice! "Small"
            appearing_monster_name.slice! "Large"
          end
          appearing_monsters = Monster.where(game_id: self.id).where("monster LIKE '%#{appearing_monster_name}%'")
          appearing_monsters.each do |monster|
            monster.on_board = true
            monster.clearing_id = sound_chit.clearing_id
            monster.prowling = true
            monster.save
          end
        end
      end
    end

    unless gold_sites_here.empty?
      gold_sites_here.each do |gold_site|
        record(player_id, "Player #{player_id} sees the #{gold_site.name}.", false)
        site_appears = gold_site.name.downcase + "_appears"
        appearing_monster = Monster.where(game_id: self.id).where("#{site_appears} IS 't'").where(dead: false).where(on_board: false).where(spawn_row: self.spawn_row)
        if appearing_monster != nil
          appearing_monster.on_board = true
          appearing_monster.clearing_id = gold_site.clearing_id
          appearing_monster.prowling = true
          appearing_monster.save
        end
      end
    end

    unless warning_chits_here.empty?
      warning_chits_here.each do |warning_chit|
        record(player_id, "There's #{warning_chit.name.downcase} in player #{player_id}'s tile.", false)
        warning_appears = warning_chit.name.downcase + "_appears"
        appearing_monster_name = Monster.where(game_id: self.id).where(dead: false).where(on_board: false).where(spawn_row: self.spawn_row).where("#{warning_appears} IS 't'").first.monster
        unless appearing_monster_name.empty?
          if (appearing_monster_name.include? "Goblin") || (appearing_monster_name.include? "Wolf")
            appearing_monster_name.slice! "Small"
            appearing_monster_name.slice! "Large"
            appearing_monster_name.slice! "Light"
            appearing_monster_name.slice! "Medium"
          end

          appearing_monsters = Monster.where(game_id: self.id).where("monster LIKE '%#{appearing_monster_name}%'")
          appearing_monsters.each do |monster|
            monster.on_board = true
            monster.clearing_id = clearing_id
            monster.prowling = true
            monster.save
          end
        end
      end
    end
  end

  def record(player_id, notification, private_action)
    r = Notification.new(player: player_id, game: self, action: notification, private_notification: private_action, turn: self.turn)
    r.save
  end

  def go_to_bird_song
    combat_completed!
    self.turn += 1
    save
    day_complete!
  end

  def determine_winners
    great_treasures_multiplier, fame_multiplier, notoriety_multiplier, gold_multiplier = 1, 10, 20, 30
    player_points = {}
    gt_points, fame_points, notoriety_points, gold_points = 0, 0, 0, 0

    all_players = Player.where(game_id: self.id).where(dead: false)
    all_players.each do |player|

      great_treasures_vps = Treasure.where(game_id: self.id).where(player_id: player.id).where(great: true).count
      fame_from_items = Treasure.where(game_id: self.id).where(player_id: player.id).sum(:fame_value)
      fame_vps = player.fame + fame_from_items
      notoriety_from_items = Treasure.where(game_id: self.id).where(player_id: player.id).sum(:notoriety_value)
      notoriety_vps = player.notoriety + notoriety_from_items
      gold_vps = player.gold - 10

      if player.great_treasures_vps > 0
        gt_needed = player.great_treasures_vps * great_treasures_multiplier
        gt_points = great_treasures_vps - gt_needed
        if gt_points < 0
          gt_points = gt_points * 3
        end
        base_gt = gt_points/great_treasures_multiplier
        bonus_gt = base_gt * great_treasures_vps
      end
      if player.fame_vps > 0
        fame_needed = player.fame_vps * fame_multiplier
        fame_points = fame_vps - fame_needed
        if fame_points < 0
          fame_points = fame_points * 3
        end
        base_fame = fame_points/fame_multiplier
        bonus_fame = base_fame * fame_vps
      end
      if player.notoriety_vps > 0
        notoriety_needed = player.notoriety_vps * notoriety_multiplier
        notoriety_points = notoriety_vps - notoriety_needed
        if notoriety_points < 0
          notority_points = notoriety_points * 3
        end
        base_notoriety = notoriety_points/notoriety_multiplier
        bonus_notoriety = base_notoriety * notoriety_vps
      end
      if player.gold_vps > 0
        gold_needed = player.gold_vps * gold_multiplier
        gold_points = gold_vps - gold_needed
        if gold_points < 0
          gold_points = gold_points * 3
        end
        base_gold = gold_points/gold_multiplier
        bonus_gold = base_gold * gold_vps
      end

      grand_total = base_gold + base_notoriety + base_fame + base_gt + bonus_gt + bonus_fame + bonus_notoriety + bonus_gold
      player_points["#{player.id}"] = grand_total
    end

    dead_players = Player.where(game_id: self.id).where(dead: true)
    dead_players.each do |player|
      player_points["#{player_id}"] = -100
    end

    return player_points.max_by{ |k,v| v }, player_points
  end
end
