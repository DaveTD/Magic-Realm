class ActionQueuesController < ApplicationController

  def create
    @action = ActionQueue.create(action_queue_params)
    @player = Player.find params[:player_id]
    @actions_queues = @player.action_queues
    render 'players/show'
  end

  def update
    @action = ActionQueue.find params[:id]
    @action.update_attribute :clearing_id, params[:clearing_id]

    @player = @action.player
    @actions_queues = @player.action_queues

    render 'players/show'
  end

  private
  def action_queue_params
    params.require(:action_queue).permit(:player_id, :clearing_id, :action_name)
  end
end
