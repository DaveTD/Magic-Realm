class ActionQueuesController < ApplicationController
  before_action :find_player

  def create
    @action_queue = ActionQueue.create(action_queue_params)
    render 'action_queues/action_queue'
  end

  def update
    @action_queue = ActionQueue.find params[:id]
    @action_queue.update_attribute :clearing_id, params[:clearing_id]
    render 'action_queues/action_queue.rabl'
  end

  def actions_this_turn
    @action_queues = ActionQueue.actions_this_turn(@player)
    render 'action_queues/index.rabl'
  end

  private
  def action_queue_params
    params.require(:action_queue).permit(:player_id, :clearing_id, :action_name, :turn, :action_this_turn)
  end
  def find_player
    @player = Player.find params[:player_id]
  end
end
