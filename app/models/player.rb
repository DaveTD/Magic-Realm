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

  def perform_action
    action_queues = ActionQueue.where(player_id: self.id).where(turn: game.turn)
  end

  def perform_move
  end

  def perform_hide
  end
end
