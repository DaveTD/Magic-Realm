class PlayersController < ApplicationController

  def create
    @player = Player.create(player_params)
    render json: @player
  end

  def show
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
    render 'players/show'
  end

  def update
  end

  def move_clearing
    @player = Player.find params[:id]
    @player.clearing_id = params[:clearing_id] if params[:clearing_id]
    @player.save
    render 'players/show'
  end

  def destroy_last_action
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
    @action_queues.last.destroy
    render 'players/show'
  end

  def next_action
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
    @player.do_next_action
  end

  def perform_search
    @player = Player.find params[:id]
    @player.perform_search(params[:search_action])
    @action_queues = @player.action_queues
    render 'players/show'
  end

  def choose_search
    @player = Player.find params[:id]
    @player.search_choice(params[:search_choice])
    @action_queues = @player.action_queues
    render 'players/show'

  def submit_actions
    @player = Player.find params[:id]
    @player.submit_actions
  end

  private
  def player_params
    params.require(:player).permit(:first_name, :last_name, :game_id, :great_treasures_vps, :usable_spells_vps, :fame_vps, :notoriety_vps, :gold_vps)
  end
end
