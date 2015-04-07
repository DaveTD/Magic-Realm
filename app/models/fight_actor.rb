class FightActor < ActiveRecord::Base
  belongs_to :player
  belongs_to :monster
  belongs_to :fight_queue
  belongs_to :game
  has_many :fight_actions

  after_create :init

  def init
    self.state = 'fighting'
    self.dead = 'false'
    save
  end

  def deal_damage
    results = self.calculate_damage
    if player_id != nil
      self.player.wound!(results)
    else
      monster.wound!(results)
    end
  end

  def player_choice choice
    if choice == 'agree'
      self.state = 'agree'
      save
    elsif choice == 'continue'
      self.state = 'continue'
      save
    else
      run_away?
    end
  end

  def run_away?
    r = rand(1..100)
    if r < 50
      self.state = 'runaway'
      save
      self.player.ran_away!
    else
      self.state = 'continue'
    end
  end

  def calculate_damage
    actor_action = self.fight_actions.last
    fas = FightAction.where(fight_round: self.fight_queue.fight_round, target: self.id) - [actor_action]

    wounds = fas.map{|fa| fa.wounds(actor_action.defence)}
    wounds = wounds.inject{|sum,x| sum + x }
    wounds = 0 if wounds.nil?

    fatigue = fas.map{|fa| fa.fatigue(actor_action.defence)}
    fatigue = fatigue.inject{|sum,x| sum + x }
    fatigue = 0 if fatigue.nil?

    fas.map{|fa| fa.update_attributes(complete: true)}

    {wounds: wounds, fatigue: fatigue}
  end
end
