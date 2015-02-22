class ActionQueuesController < ApplicationController
  before_action :find_player_and_action_queues

  def create
    @action = ActionQueue.create(action_queue_params)
    render 'players/show'
  end

  def update
    @action = ActionQueue.find params[:id]
    @action.update_attribute :clearing_id, params[:clearing_id]
    render 'players/show'
  end

  private
  def action_queue_params
    params.require(:action_queue).permit(:player_id, :clearing_id, :action_name, :turn, :action_this_turn)
  end
  def find_player_and_action_queues
    @player = Player.find params[:player_id]
    @actions_queues = @player.action_queues
  end
end
