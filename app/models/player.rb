class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :clearing
  has_many :action_queues
  has_many :action_chits
  has_many :notifications
  belongs_to :weapon
  belongs_to :boots
  belongs_to :suit_of_armor
  belongs_to :shield
  belongs_to :helmet
  belongs_to :breast_plate
  belongs_to :hirelings
  belongs_to :character_class
  belongs_to :inventory

  after_create :init

  def init
    self.clearing_id = 68
    self.ready = false
    self.dead = false
    self.actions_submitted = false
    self.hidden = false
    self.found_hidden_enemies = false
    self.wounds = 0
    self.fatigue = 0
    self.block = false
    save
  end

  def change_action_state
    self.actions_submitted = true
    save
    game.actions_submitted
  end

  def do_block
    actions_to_remove = ActionQueue.where(player_id: self.id).where(turn: game.turn)
    actions_to_remove.destroy!
    hidden = false
    # something needs to force the player to pass their turn if they block during their own turn in order to
    # prevent them from trading until the evening
  end

  def do_next_action dice
    action = ActionQueue.next_turn(self)
    unless action.search?
      self.send(("perform_#{action.action_name}").to_sym, action, dice)
      if (action.action_name == "rest") && self.character_class.id == 6
        perform_rest action, dice
      end
      action.complete_action!
    end
  end

  def perform_move(action, dice)
    all_monsters = Monster.where(game_id: self.game_id, clearing_id: action.clearing_id)

    all_monsters.each do |monster|
      if !self.hidden
        self.blocked!
        monster.prowling = false
        return
      end
    end

    self.clearing_id = action.clearing_id
    save
    record("Player #{self.name} moved to #{action.clearing.tile.name} - #{action.clearing.clearing_number}.", false)

    all_players = Player.where(game: self.game)
    all_players = all_players - [self]
    return if all_players.empty?

    all_players.each do |other_player|
      next if self.clearing_id != other_player.clearing_id

      if self.block?
        if (other_player.hidden? && self.found_hidden_enemies?) || !other_player.hidden?
          other_player.blocked!
          self.blocked!
          break
        end
      end
      if other_player.block?
        if (self.hidden? && other_player.found_hidden_enemies?) || !self.hidden?
          self.blocked!
          other_player.blocked!
          break
        end
      end
    end
  end

  def blocked!
    aqs = self.action_queues.update_all(completed: true)
    self.hidden = false
    record("Player #{self.name} was blocked and have no more actions this turn", false)
    save
  end

  def perform_hide(action, dice)
    result = "failed to hide"
    roll = Random.rand(1..6)
    roll = dice if dice

    if roll != 6
      self.hidden = true
      save
      result = "successfully hid"
    else
      result = "failed to hide"
    end
    record("Player #{self.name} #{result} in clearing #{action.clearing.id}.", false)
  end

  def perform_enchant(action, dice)
    tile = self.clearing.tile
    tile.enchanted = true
    tile.save
    record("Player #{self.name} enchanted the #{tile.name} tile", false)
  end

  def perform_loot(action, dice)
    result = "found nothing"
    roll = Random.rand(1..6)
    roll = dice if dice
    item = loot_clearing(roll)
    if item != nil
      item.pile = nil
      item.player_id = self.id
      item.save
      result = "found #{item.name}"
    else
      result = "nothing found"
    end
    record("Player #{self.name} rolled a #{roll} #{result} when looting", false)
  end

  def loot_clearing(roll)
    looted_item = nil
    looting_site = GoldSite.where(game_id: self.game.id).where(clearing_id: self.clearing_id).first
    in_city = looting_site.try(:lost_city?)
    in_castle = looting_site.try(:lost_castle?)
    city_map_owner = Treasure.where(game_id: self.game.id).where(name: 'Map of Lost City').pluck(:player_id).first
    castle_map_owner = Treasure.where(game_id: self.game.id).where(name: 'Map of Lost Castle').pluck(:player_id).first
    if in_city && (city_map_owner == self.id)
      if roll > 1
        roll = roll - 1
      end
      record("Player #{self.name} is looting in the lost city tile and owns the Map of Lost City! Roll reduced!", false)
    end
    if in_castle && (castle_map_owner == self.id)
      if roll > 1
        roll = roll - 1
      end
      record("Player #{self.name} is looting in the lost castle tile and owns the Map of Lost Castle! Roll reduced!", false)
    end
    if looting_site != nil
      pile = looting_site.site_name.downcase
      large_treasures = Treasure.where(pile: pile).where(large: true)
      small_treasures = Treasure.where(pile: pile).where(large: false)
      all_treasures = large_treasures + small_treasures
      looted_item = all_treasures[roll - 1]
    end
    return looted_item
  end

  def perform_search(search_action, dice)
    action = ActionQueue.next_turn(self)
    if search_action == 'peer'
      self.peer(action, dice)
    else
      self.locate(action, dice)
    end
  end

  def peer(action, dice)
    roll = Random.rand(1..6)
    roll = dice if dice
    case roll
    when 1
      return 1
    when 2
      search_clues(action.clearing.tile, roll)
      search_paths(action.clearing, roll)
    when 3
      search_hidden_enemies(1)
      search_paths(action.clearing, roll)
    when 4
      search_hidden_enemies(1)
    when 5
      search_clues(action.clearing.tile, roll)
    when 6
      record("Player #{self.name} peered, rolled a 6 and did nothing", false)
    end
    action.complete_action!
  end

  def locate(action, dice)
    roll = Random.rand(1..6)
    roll = dice if dice
    case roll
    when 1
      return 1
    when 2
      search_passages(action.clearing, roll)
      search_clues(action.clearing.tile, roll)
    when 3
      search_passages(action.clearing, roll)
    when 4
      search_discover_chits(action.clearing.tile, action.clearing, roll)
    when 5, 6
      record("Player #{self.name} located, rolled a 5 or 6 and did nothing.", false)
    end
    action.complete_action!
  end

  def search_choice(search_choice)
    #give the player the choice of any of the peer or locate options
    action = ActionQueue.next_turn(self)
    case search_choice
    when 'Clues and Paths'
      search_clues(action.clearing.tile, 1)
      search_paths(action.clearing, 1)
    when 'Hidden Enemies & Paths'
      search_hidden_enemies(1)
      search_paths(action.clearing, 1)
    when 'Passages & Clues'
      search_passages(action.clearing, 1)
      search_clues(action.clearing.tile, 1)
    when 'Hidden Enemies'
      search_hidden_enemies(1)
    when 'Clues'
      search_clues(action.clearing.tile, 1)
    when 'Passages'
      search_passages(action.clearing, 1)
    when 'Discover Chits'
      search_discover_chits(action.clearing.tile, action.clearing, 1)
    end
    action.complete_action!
  end

  def search_paths(clearing, roll)
    found_path = FoundHiddenPath.new(player: self, game: self.game, clearing: clearing)
    found_path.save
    record("Player #{self.name} rolled a #{roll} and found hidden paths in #{clearing.tile.name} - #{clearing.clearing_number}", false)
  end

  def search_hidden_enemies(roll)
    found_hidden_enemies = true
    record("Player #{self.name} rolled a #{roll} and found hidden enemies in #{clearing.tile.name} - #{clearing.clearing_number}", false)
  end

  def search_clues(tile, roll)
    # give the player a modal that shows all the map chits on this tile
    # give the option to swap out replacement tiles

    record("Player #{self.name} rolled a #{roll} and looked for clues in tile #{tile.name}", true)
  end

  def search_passages(clearing, roll)
    found_passage = FoundHiddenPassage.new(player: self, game: self.game, clearing: clearing)
    found_passage.save
    record("Player #{self.name} rolled a #{roll} and found hidden passages in #{clearing.tile.name} - #{clearing.clearing_number}", false)
  end

  def search_discover_chits(tile, clearing, roll)
    search_clues(tile, roll)
    discovered_chits = DiscoveredChitsClearing.where(player: self, game: self.game, clearing: clearing).first
    if discovered_chits.nil?
      discovered_chits = DiscoveredChitsClearing.new(player: self, game: self.game, clearing: clearing)
      discovered_chits.save
      record("Player #{self.name} rolled a #{roll} and discovered chits #{clearing.tile.name} - #{clearing.clearing_number}", false)
    else
      record("Player #{self.name} rolled a #{roll}, but alrady discovered the chits in #{clearing.tile.name} - #{clearing.clearing_number}", false)
    end
  end

  def perform_rest(action, dice)
    healed = ""
    if self.wounds > 0
      self.wounds = self.wounds - 1
      self.fatigue = self.fatigue + 1
      healed = "wound"
    elsif self.fatigue > 0
      self.fatigue = self.fatigue - 1
      healed = "fatigue"
    end
    self.save
    record("Player #{self.name} rested, healing a #{healed} in #{action.clearing.tile.name} - #{action.clearing.clearing_number}", false)
  end

  def record(notification, private_action)
    r = Notification.new(player: self, game: self.game, action: notification, private_notification: private_action, turn: self.game.turn)
    r.save
  end

  def name
    if self.first_name && self.last_name
      return self.first_name + self.last_name
    else
      return ""
    end
  end

  def current_action
    return ActionQueue.next_turn(self).try(:action_this_turn)
  end

  def last_unseen_notificaiton
    note = Notification.where(player_id: id).is_private.not_shown.last
    note.shown = true && note.save unless note.nil?
    return note
  end

  def end_turn
    player_queue = PlayersQueue.where(player_id: id).incomplete.first
    player_queue.complete = true
    player_queue.save
    self.game.create_denizens self.clearing_id, self.id
    self.game.move_denizens_in_tile(self.clearing.tile, self)
    self.game.start_next_turn
  end

  def run_away!
    clearing = self .clearing
    tcs = clearing.traversable_clearings
    tc = tcs.sample(1).first
    new_clearing = tc.traversable
    self.clearing_id = new_clearing.id
    save
  end

  def wound!(results)
    self.wounds += results[:wounds]
    self.fatigue += results[:fatigue]
    if ((self.wounds*2) + self.fatigue) >= 12
      self.dead = true
    end
    save
  end
  def give_treasure_pile t_pile
    t_pile.each do |t|
      t.player_id = self.id
      t.save
    end
  end
end
