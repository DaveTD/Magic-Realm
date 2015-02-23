class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :clearing
  has_many :action_queues
  has_many :action_chits
  belongs_to :weapon
  belongs_to :boots
  belongs_to :suit_of_armor
  belongs_to :shield
  belongs_to :helmet
  belongs_to :breast_plate
  belongs_to :horse
  belongs_to :hirelings
  belongs_to :curses
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
    actions_submitted = true
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
    action = ActionQueue.next_turn(self, self.game)
    unless action.search?
      self.send(("perform_#{action.action_name}").to_sym, action)
      action.complete_action!
    end
  end

  def perform_move(action)
    self.clearing_id = action.clearing_id && save
    record("Player #{self.id} moved to clearing #{action.clearing}.", false)

    # check if monster or player is blocking
    all_monsters = Monsters.all
    #all_players = Players.all

    all_monsters.each do |monster|
      if self.clearing_id == monster.clearing.id && !self.hidden
        blocked!
        monster.prowling = false
        monster.blocked = true
      end
    end
    #all_players.each do |other_player|
    #  if self.clearing_id == other_player.clearing.id
    #  case self.hidden
    #  when true
    #    if other_player.found_hidden_enemies
    #        # pop a modal for other_player
    #      end
    #    end
    #  when false
    #    # pop a modal for the other_player
    #  end
  end

  def perform_hide(action)
    result = "successfully hid"
    roll = Random.rand(1..6)
    if roll != 6
      hidden = true
      result = "failed to hide"
    end
    record("Player #{self.id} #{result} in clearing #{action.clearing}.", false)
  end

  def perform_search(search_action)
    action = ActionQueue.next_turn(self, self.game)
    if search_action == 'peer'
      self.peer(action)
    else
      self.locate(action)
    end
  end

  def peer(action)
    # roll = Random.rand(1..6)
    roll = 1
    case roll
    when 1
      return 1
    when 2
      search_clues(action.clearing.tile)
      search_paths(action.clearing)
    when 3
      search_hidden_enemies
      search_paths(action.clearing)
    when 4
      search_hidden_enemies
    when 5
      search_clues(action.clearing.tile)
    end
    action.complete_action!
  end

  def locate(action)
    # roll = Random.rand(1..6)
    roll = 1
    case roll
    when 1
      return 1
    when 2
      search_passages(action.clearing)
      search_clues(action.clearing.tile)
    when 3
      search_passages(action.clearing)
    when 4
      search_discover_chits(action.clearing.tile, action.clearing)
    end
    action.complete_action!
  end

  def search_choice(search_choice)
    #give the player the choice of any of the peer or locate options
    action = ActionQueue.next_turn(self, self.game)
    case search_choice
    when 'Clues and Paths'
      search_clues(action.clearing.tile)
      search_paths(action.clearing)
    when 'Hidden Enemies & Paths'
      search_hidden_enemies
      search_paths(action.clearing)
    when 'Passages & Clues'
      search_passages(action.clearing)
      search_clues(action.clearing.tile)
    when 'Hidden Enemies'
      search_hidden_enemies
    when 'Clues'
      search_clues(action.clearing.tile)
    when 'Passages'
      search_passages(action.clearing)
    when 'Discover Chits'
      search_discover_chits(action.clearing.tile, action.clearing)
    end
    action.complete_action!
  end

  def search_paths(clearing)
    # found_path = FoundHiddenPath.new(self, self.game, clearing.id)
    found_path.save
    record("Player #{self.id} found hidden paths in clearing #{clearing.id}", false)
  end

  def search_hidden_enemies
    found_hidden_enemies = true
    record("Player #{self.id} found hidden enemies in clearing #{clearing.id}", false)
  end

  def search_clues(tile)
    # give the player a modal that shows all the map chits on this tile
    # give the option to swap out replacement tiles

    record("Clues in tile #{tile.name}", true)
  end

  def search_passages(clearing)
    found_passage = FoundHiddenPassage.new(player: self, game: self.game, clearing: clearing.id)
    found_path.save
    record("Player #{self.id} found hidden passages in clearing #{clearing.id}", false)
  end

  def search_discover_chits(tile, clearing)
    search_clues(tile)
    discovered_chits = DiscoveredChitsClearing.new(player: self, game: self.game, clearing: clearing.id)
    discovered_chits.save
    record("Discovered in clearing #{clearing.id}", true)
    record("Player #{self.id} discovered chits in clearing #{clearing.id}", false)
  end

  def perform_rest(action)
    #harmed_chits = ActionChits.where(player_id: self.id).where('damage > 0')
    record("Player #{self.id} rested in clearing #{clearing.id}", false)
  end

  def blocked!
    actions_to_remove = ActionQueue.where(player_id: self.id).where(turn: game.turn).where(game: self.game)
    actions_to_remove.each do |action|
      action.complete_action!
      # in the future, this might be changing to a blocked action, where you can still trade, if trade is to be implemented
    end
  end

  def record(notification, private_action)
    r = Notification.new(player: self, game: self.game, action: notification, private_notification: private_action, turn: self.game.turn)
    r.save
  end

  def current_action
    return ActionQueue.next_turn(self, self.game).try(:action_this_turn)
  end
end
