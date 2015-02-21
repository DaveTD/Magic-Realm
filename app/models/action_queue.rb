class ActionQueue < ActiveRecord::Base
  belongs_to :player
  belongs_to :action_chit
  belongs_to :clearing

  scope :movements, -> {where(action_name: 'move')}
  scope :hides, -> {where(action_name: 'hide')}
  scope :searches, -> {where(action_name: 'search')}
  scope :rests, -> {where(action_name: 'rest')}

  def move?
    self.action_name == 'move'
  end
  def hide?
    self.action_name == 'hide'
  end
  def search?
    self.action_name == 'search'
  end
  def rest?
    self.action_name == 'rest'
  end

  def can_move?
    return player.action_queues.count < 2 + day_moves
  end

  def can_hide?
    return player.action_queues.count < 2 + day_moves
  end

  def can_search?
    return player.action_queues.count < 2 + day_moves
  end

  def can_rest?
    return player.action_queues.count < 2 + day_moves
  end

  def target_clearings
    return where_can_move if move?
    return where_can_search if search?
    return []
  end

  def where_can_move
    move_value = 2 + day_moves
    traversable = self.clearing.traversable_clearings
    if(move_value < 2)
      traversable.map { |trav| trav if trav.traversable.mountain?}.compact
    end
    return traversable
  end

  def where_can_search
    if self.clearing.mountain?

    else
      self.clearing
    end
  end


  private

  def day_moves
    return cave_movement? ? 0 : 2
  end
  def cave_movement?
    move = self.player.clearing.cave?
    actions = player.action_queues.all
    actions.each do |a|
      move &= a.clearing.cave?
    end
    return move
  end
end
