class ActionQueuesController < ApplicationController
  before_action :find_player
  before_action :find_action, except [:create]

  def create
    @action_queue = @player.action_queue.build(params)
    @action_queue.save
    render 'action_queues/action_queue'
  end

  def update
    @action_queue.update_attribute :clearing_id, params[:clearing_id]
    render 'action_queues/action_queue'
  end

  def destroy
    @action.destroy
  end

  private
  def action_queue_params
    params.require(:action_queue).permit(:clearing_id, :action_name, :turn, :action_this_turn)
  end

  def find_player
    @player = Player.find params[:player_id]
  end
  def find_action
    @action = ActionQueue.find params[:id]
  end
end
