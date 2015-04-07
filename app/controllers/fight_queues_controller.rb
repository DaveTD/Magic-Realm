class FightQueuesController < ApplicationController
  before_action :find_fight_action, except: [:find_fight]

  def submit_fight
    @fight_action = FightAction.find(params[:fight_id])
    @fight_action.update_attributes(attack: params[:attack], defence: params[:defence], target_id: params[:target].to_i)
    @fight_action.complete = true
    @fight_action.save
    @fight_queue.seleceted_actions
    render json: @figth_action
  end

  def find_fight
    @player = Player.find params[:player_id]
    @game = @player.game
    fight_actor = FightActor.where(player_id: @player.id, turn: @game.turn).first
    unless fight_actor
      @fight_queue = FightQueue.create(game_id: @game.id, clearing_id: @player.clearing.id)
      @fight_queue.create_fight
    else
      @fight_queue = fight_actor.fight_queue
    end
    render json: {queue: @fight_queue}
  end

  def fight
    @player = Player.find params[:player_id]
    @game = @player.game
    @fight_actor = FightActor.where(player_id: @player.id, turn: @game.turn).last
    render json: {queue: @fight_actor.fight_queue, actor: @fight_actor, action: @fight_actor.fight_actions.last}
  end

  def other_fights
    @fa = FightActor.find params[:actor_id]
    @fight_actors = @fa.fight_queue.fight_actors - [@fa]
    render 'fight_actors'
  end

  def current_state
    @fight_actors = @fight_queue.fight_actors
    @players_incomplete = FightAction.where(fight_queue_id: @fight_queue.id, fight_round: @fight_queue.fight_round).incomplete.map{|fa| fa.fight_actor.player.name if fa.fight_actor.monste_id == nil}.compact
    render json: {current_state: @fight_queue.state, players: @players_incomplete}
  end

  def player_choice
    @fight_actor = FightActor.where(id: params[:fight_id]).first
    @fight_actor.player_choice(params[:option])
    @fight_queue.still_waiting
    render json: @figth_queue
  end

  private
  def find_fight_action
    @fight_queue = FightQueue.find params[:id]
  end

end
