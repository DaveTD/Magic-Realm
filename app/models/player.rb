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

  after_initialize :init

  def init
    self.clearing_id ||= 68
    self.ready = false if ready.nil?
    self.dead = false if dead.nil?
    self.actions_submitted = false if self.actions_submitted.nil?
    self.hidden = false if hidden.nil?
    self.found_hidden_enemies = false if hidden.nil?
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

  def do_next_action
    action = ActionQueue.next_turn(self)
    unless action.search?
      self.send(("perform_#{action.action_name}").to_sym, action)
      action.complete_action!
    end
  end

  def perform_move(action)
    all_monsters = Monster.all

    all_monsters.each do |monster|
      if self.clearing_id == monster.clearing.id && !self.hidden
        blocked!
        monster.prowling = false
        monster.blocked = true
        return
      end
    end

    self.clearing_id = action.clearing_id
    save
    record("Player #{self.name} moved to #{action.clearing.tile.name} - #{action.clearing.clearing_number}.", false)

    all_players = Players.all
    all_players = all_players - self
    all_players.each do |other_player|
      if self.clearing_id == other_player.clearing.id
      case self.hidden
      when true
        if other_player.found_hidden_enemies
          # pop a modal for other_player
        end

      when false
       # pop a modal for the other_player
      end
  end

  def perform_hide(action)
    result = "successfully hid"
    roll = Random.rand(1..6)
    if roll != 6
      hidden = true
      result = "failed to hide"
    end
    record("Player #{self.name} #{result} in clearing #{action.clearing.id}.", false)
  end

  def peform_loot
    result = "found nothing"
    roll = Random.rand(1..6)
    item = loot_clearing(roll)
    if item != nil
      item.pile = nil
      item.player_id = self.id
      result = "found #{item.name}"
    end
    record("Player #{self.name} rolled a #{roll} #{result} when looting", false)
  end

  def loot_clearing(roll)
    looted_item = nil
    looting_site = GoldSite.where(clearing_id: self.clearing_id).first
    if looting_site != nil
      pile = looting_site.site_name
      large_treasures = Treasure.where(pile: pile).where(large: true)
      small_treasures = Treasure.where(pile: pile).where(large: false)
      all_treasures = []
      all_treasures << large_treasures << small_treasures
      all_treasures.flatten

      looted_item = all_treasures[roll - 1]
    end
    return looted_item
  end

  def perform_search(search_action)
    action = ActionQueue.next_turn(self)
    if search_action == 'peer'
      self.peer(action)
    else
      self.locate(action)
    end
  end

  def peer(action)
    roll = Random.rand(1..6)
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
      record("Player #{self.name} peered, rolled a 6 and did nothing")
    end
    action.complete_action!
  end

  def locate(action)
    roll = Random.rand(1..6)
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
      record("Player #{self.name} located, rolled a 5 or 6 and did nothing.")
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

  def search_paths(clearing)
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
    search_clues(tile)
    discovered_chits = DiscoveredChitsClearing.new(player: self, game: self.game, clearing: clearing)
    discovered_chits.save
    record("Discovered in clearing #{clearing.id}", true)
    record("Player #{self.name} rolled a #{roll} and discovered chits #{clearing.tile.name} - #{clearing.clearing_number}", false)
  end

  def perform_rest(action)
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

  def blocked!
    actions_to_remove = ActionQueue.where(player_id: self.id).where(turn: game.turn).where(game: self.game)
    actions_to_remove.each do |action|
      action.complete_action!
      # in the future, this might be changing to a blocked action, where you can still trade, if trade is to be implemented
    end
    record("Player #{self.name} was blocked by an evil #{monster.name}!", false)
  end

  def record(notification, private_action)
    r = Notification.new(player: self, game: self.game, action: notification, private_notification: private_action, turn: self.game.turn)
    r.save
  end

  def name
    self.first_name + self.last_name
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
    game.create_denizens self.clearing_id
    game.start_next_turn
  end
end
