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

  def submit_actions
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
    action = ActionQueue.next_turn(self)
    unless action.search?
      self.send(("perform_#{action.action_name}").to_sym, action)
      action.complete = true
    end
    action.save
  end

  def perform_move(action)
    #check if blocked first

    #if not blocked, then move
    clearing = action.clearing
  end

  def perform_hide(action)
    roll = Random.rand(1..6)
    if roll != 6
      hidden = true
    end
  end

  def perform_search(search_action)
    action = ActionQueue.next_turn(self)
    if search_action == 'peer'
      self.search(action)
    else
      self.locate(action)
    end
  end

  def peer(action)
    roll = Random.rand(1..6)
    case roll
    when 1
      #search_choice
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
  end

  def locate(action)
    roll = Random.rand(1..6)
    case roll
    when 1
      #search_choice
    when 2
      search_passages(action.clearing)
      search_clues(action.clearing.tile)
    when 3
      search_passages(action.clearing)
    when 4
      search_discover_chits(action.clearing.tile, action.clearing)
    end
  end


  def search_choice
    #give the player the choice of any of the peer or locate options
    action = ActionQueue.next_turn(self)
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
      search_clues
    when 'Passages'
      search_passages
    when 'Discover chits'
      search_discover_chits
    end
  end

  def search_paths(clearing)
    found_path = FoundHiddenPath.new(self, self.game, clearing.id)
    found_path.save
  end

  def search_hidden_enemies
    found_hidden_enemies = true
  end

  def search_clues(tile)
    # give the player a modal that shows all the map chits on this tile
    # give the option to swap out replacement tiles
  end

  def search_passages(clearing)
    found_passage = FoundHiddenPassage.new(self, self.game, clearing.id)
    found_path.save
  end

  def search_discover_chits(tile, clearing)
    search_clues(tile)
    discovered_chits = DiscoveredChitsClearing.new(self, self.game, clearing.id)
    discovered_chits.save
  end

  def perform_rest(action)
    harmed_chits = ActionChits.where(player_id: self.id).where('damage > 0')
  end

end
