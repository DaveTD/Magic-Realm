class PlayersQueuesController < ApplicationController
  def index
    @players_queues = PlayersQueue.where(game_id: params[:game_id])
  end

  def edit
    @players_queue = PlayersQueue.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    players_queue = PlayersQueue.where(game_id: params[:game_id]).where(id: params[:id]).first
    players_queue.update!(players_queue_params)
    redirect_to game_players_queues_path
  end

  def show
    @players_queue = PlayersQueue.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    PlayersQueue.create(players_queue_params)
    redirect_to game_players_queues_path
    #players_queue.save
  end

  def new
    @players_queue = PlayersQueue.new
  end

  def destroy
    @players_queue = PlayersQueue.where(game_id: params[:game_id]).where(id: params[:id]).first
    @players_queue.destroy
    redirect_to game_players_queues_path
  end

  def set_default_response_format
    request.format = [:html] unless params[:format]
  end

private
  def players_queue_params
    params.require(:players_queue).permit(:player, :turn_number, :completed)
  end
end
