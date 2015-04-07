class FightAction < ActiveRecord::Base
  belongs_to :fight_queue
  belongs_to :fight_actor
  belongs_to :target, class_name: 'FightActor'

  scope :incomplete, ->{where(complete: false)}
  scope :complete, ->{where(complete: true)}

  after_create :init

  def init
    self.complete = false
    save
  end

  def complete!
    self.complete = true
    save
  end

  def random_action
    return if self.complete == true
    players = self.fight_queue.fight_actors.where(monster_id: nil)

    r_attack = rand(1..3)
    r_defence = rand(1..3)
    r_target = (rand(1..(players.count))) - 1

    self.attack = to_attack(r_attack)
    self.defence = to_defence(r_defence)
    self.target_id = players[r_target].id
    self.complete = true
    save
  end

  # ATTACK TABLE
  #
  #         THURST  SWING    SMASH
  # CHARGE  wound   fatigue  miss
  # DODGE   miss    wound    fatigue
  # DUCK    fatigue miss     wound
  def wounds(defence)
    case_one = (attack == 'thurst' && defence == 'charge')
    case_two = (attack == 'swing' && defence == 'dodge')
    case_three = (attack == 'smash' && defence == 'duck')
    if case_one || case_two || case_three
      return 1
    end
    return 0
  end

  def fatigue(defence)
    case_one = (attack == 'thurst' && defence == 'duck')
    case_two = (attack == 'swing' && defence == 'charge')
    case_three = (attack == 'smash' && defence == 'dodge')
    if case_one || case_two || case_three
      return 1
    end
    return 0
  end

  private

  def to_attack(int)
    case int
    when 1
      'thrust'
    when 2
      'swing'
    when 3
      'smash'
    end
  end

  def to_defence(int)
    case int
    when 1
      'charge'
    when 2
      'dodge'
    when 3
      'duck'
    end
  end
end
