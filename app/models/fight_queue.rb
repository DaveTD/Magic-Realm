class FightQueue < ActiveRecord::Base
  include AASM

  has_many :fight_action
  has_many :fight_actors
  belongs_to :game
  belongs_to :clearing

  aasm  :column => 'state' do
    state :create, :initial => true
    state :select
    state :calculate_actions
    state :continue_or_run
    state :complete

    event :set_up_fight do
      transitions :from => :create, :to => :select
    end

    event :actions_all_selected do
      transitions :from => :select, :to => :calculate_actions
    end

    event :all_actions_calcualated do
      transitions :from => :calculate_actions, :to => :continue_or_run
    end

    event :continue do
      transitions :from => :continue_or_run, :to => :create
    end

    event :complete do
      transitions :from => :continue_or_run, :to => :complete
    end
  end

  def create_fight
    all_players = Player.where(game_id: self.game_id, clearing_id: self.clearing_id)
    monsters = Monster.where(game_id: self.game_id, clearing_id: self.clearing_id)
    all_players.each do |player|
      fa = FightActor.create(player_id: player.id, game_id: self.game_id, fight_queue_id: self.id, monster_id: nil, turn: self.game.turn)
      FightAction.create(fight_queue_id: self.id, fight_actor_id: fa.id, fight_round: 1)
    end
    monsters.each do |monster|
      fa = FightActor.create(monster_id: monster.id, game_id: self.game_id, fight_queue_id: self.id, player_id: nil, turn: self.game.turn)
      FightAction.create(fight_queue_id: self.id, fight_actor_id: fa.id, fight_round: 1)
    end
    self.turn = self.game.turn
    self.fight_round = 1
    save
    set_up_fight!
  end

  def create_round
    all_charactars = self.fight_actors.where(dead: false, state: 'fighting')
    all_charactars.each do |ac|
      FightAction.create(fight_queue_id: self.id, fight_actor_id: ac.id, fight_round: (self.fight_round+1))
    end
    self.fight_round += 1
    save
    set_up_fight!
  end

  def seleceted_actions
    select_monster_actions
    fas = FightAction.where(fight_queue_id: self.id, fight_round: self.fight_round).incomplete

    if fas.empty?
      actions_all_selected!
      self.calculate_actions
      return
    end
  end

  def select_monster_actions
    monster_fas = FightActor.where(fight_queue_id: self.id, player_id: nil).where(state: 'fighting')
    monster_fas.each do |actor|
      actor.fight_actions.last.random_action
    end
  end

  def calculate_actions
    f_actors = FightActor.where(fight_queue_id: self.id)
    f_actors.each {|fa| fa.deal_damage}

    all_actions_calcualated!
  end

  def still_waiting
    players = self.fight_actors.where(monster_id: nil, dead: false, state: 'fighting')
    if players.empty?
      self.player_choice
    end
  end

  def player_choice
    players = self.fight_actors.where(monster_id: nil, dead: false).where('state != ?', 'runaway')
    monsters = self.fight_actors.where(player_id: nil, dead: false)

    agree_to_end = true
    players.each do |p|
      agree_to_end &= p.state == 'agree'
    end
    if agree_to_end && monsters.empty? || players.nil? || players.count == 1 && monsters.empty?
      complete!
      self.game.go_to_bird_song
    else
      players.each do |p|
        p.state = "fighting"
        p.save
      end
      continue!
      create_round
    end
  end

  def find_winner dead_actor_id, type
    dead_actor = FightActor.where(id: dead_actor_id).first
    f_actions = FightAction.where(fight_queue_id: self.id, fight_round: self.fight_round, target: dead_actor_id)
    f_actors = f_actions.map{|fa| fa.fight_actor}
    players, monsters = f_actors.partition{|fa| fa.monster_id == nil}
    return if players.empty?

    if type == 'player'
      treasures = Treasure.where(player_id: dead_actor.player_id)
      slice = treasures.count/players.count
      t_piles = treasures.each_slice(slice)
      t_piles.each do ts
        players.each {|p| p.give_treasure_pile(ts)}
      end
    else
      monster = dead_actor.monster
      if monster.monster == 'Jean-Pierre Corriveau'
        players.each do |p|
          item = Treasure.create(game_id: self.game_id, name: 'Rose of Real Time', large: true, spell_type: 'Awesome', fame_value: 1000, great: true, fame_price_number: 10, weight: "s", notoriety_value: 1000, price: 10000, metatreasure: false, movable: true, player_id: p.id)
        end
      end

      count = players.count
      players.each do |fa|
        p = fa.player
        p.fame_vps += (monster.fame_reward/count)
        p.notoriety_vps += (monster.notoriety_reward/count)
        p.save
      end
    end
  end
end
