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
  end

  def do_block
    actions_to_remove = ActionQueue.where(player_id: self.id).where(turn: game.turn)
    actions_to_remove.destroy!
    hidden = false
    # something needs to force the player to pass their turn if they block during their own turn in order to
    # prevent them from trading until the evening
  end

  def do_next_action
    action = ActionQueue.where(player_id: self.id).where(turn: game.turn).where(completed: false).order('id ASC').first
    self.send(("perform_#{action.action_name}").to_sym, action)
    action.complete = true
  end

  def perform_move(action)
    #check if blocked first

    #if not blocked, then move
    clearing = action.clearing
  end

  def perform_hide(action)
    roll = Random.rand(0..6)
    if roll != 6
      hidden = true
    end
  end

  def perform_search(action)

  end

  def perform_rest(action)
    harmed_chits = ActionChits.where(player_id: self.id).where()
  end

end
