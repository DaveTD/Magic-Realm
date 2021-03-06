class ActionQueue < ActiveRecord::Base
  belongs_to :player
  belongs_to :action_chit
  belongs_to :clearing

  scope :movements, -> {where(action_name: 'move')}
  scope :hides, -> {where(action_name: 'hide')}
  scope :searches, -> {where(action_name: 'search')}
  scope :rests, -> {where(action_name: 'rest')}
  scope :enchants, -> {where(action_name: 'enchant')}
  scope :not_complete, -> {where(completed: false)}
  scope :actions_this_turn, ->(player){where(player_id: player.id, turn: player.game.turn).not_complete}
  scope :next_turn, ->(player){actions_this_turn(player).not_complete.order('action_this_turn ASC').first}

  after_create :init
  after_create :set_action_this_turn

  def init
    self.completed = false
  end

  def move?
    self.action_name == 'move'
  end
  def hide?
    self.action_name == 'hide'
  end
  def loot?
    self.action_name == 'loot'
  end
  def search?
    self.action_name == 'search'
  end
  def rest?
    self.action_name == 'rest'
  end
  def enchant?
    self.action_name == 'enchant'
  end

  def can_move?
    return ActionQueue.actions_this_turn(self.player).count < (2 + day_moves + class_moves + item_moves)
  end

  def can_hide?
    return ActionQueue.actions_this_turn(self.player).count < (2 + day_moves + class_hides + item_hides)
  end

  def can_search?
    return ActionQueue.actions_this_turn(self.player).count < (2 + day_moves + item_searches)
  end

  def can_rest?
    return ActionQueue.actions_this_turn(self.player).count < (2 + day_moves + class_rests)
  end

  def can_loot?
    return ActionQueue.actions_this_turn(self.player).count < (2 + day_moves)
  end

  def can_enchant?
    only_one = ActionQueue.actions_this_turn(self.player).enchants.empty?
    count = ActionQueue.actions_this_turn(self.player).count < (2 + day_moves)
    return only_one && count
  end

  def class_moves
    if self.player.character_class.id == 1
      return 1
    end
    return 0
  end

  def class_rests
    if (self.player.character_class.id == 2) || (self.player.character_class.id == 12)
      return 1
    end
    return 0
  end

  def class_hides
    if self.player.character_class.id == 9
      return 1
    end
    return 0
  end

  def item_hides
    cloak_owner = Treasure.where(game_id: self.player.game.id).where(name: 'Cloak of Mist').pluck(:player_id).first
    if cloak_owner == self.player.id
      return 1
    end
    return 0
  end

  def item_moves
    seven_league_owner = Treasure.where(game_id: self.player.game.id).where(name: '7-League Boots').pluck(:player_id).first
    if seven_league_owner == self.player.id
      return 1
    end
    return 0
  end

  def item_searches
    spectacles_owner = Treasure.where(game_id: self.player.game.id).where(name: 'Magic Spectacles').pluck(:player_id).first
    if spectacles_owner == self.player.id
      return 1
    end
    return 0
  end

  def target_clearings
    return where_can_move if move?
    return where_can_search if search?
    return []
  end

  def where_can_move
    move_value = 2 + day_moves
    if(move_value < 2)
      clearings = self.clearing.traversable_clearings.map {|trav| trav.traversable if trav.traversable.mountain?}.compact
    else
      clearings = self.clearing.traversable_clearings.map {|trav| trav.traversable}
    end
  end

  def where_can_search
    if self.clearing.mountain?
      clearings = []
      tile = self.clearing.tile
      clearings = tile.clearings.not_cave.not_exit

      adj_tiles = tile.adjacent_tiles
      adj_tiles.each do |adj_tile|
        next_tile = adj_tile.next_tile
        clearings.push(next_tile.clearings.not_cave.not_exit)
      end
      return clearings.flatten
    else
      return self.clearing
    end
  end

  def complete_action!
    self.completed = true
    save
  end

  private

  def set_action_this_turn
    count = ActionQueue.actions_this_turn(self.player).count
    self.action_this_turn = count
    save
  end

  def day_moves
    if self.player.character_class.id == 6
      return 0
    end
    return cave_movement? ? 0 : 2
  end

  def cave_movement?
    cave_start = self.player.clearing.cave?
    move = self.clearing.cave?
    if cave_start || move
      return true
    end
    actions = ActionQueue.actions_this_turn(self.player)
    actions.each do |a|
      move ||= a.clearing.cave?
    end
    return move
  end

end
