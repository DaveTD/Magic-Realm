class PlayersController < ApplicationController
  before_action :find_player_and_action_queue
  skip_before_action :find_player_and_action_queue, :only => [:create]
  respond_to :json

  def create
    @player = Player.create(player_params)
    render json: @player
  end

  def show
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
    render 'players/show'
  end

  def destroy_last_action
    @action_queues.last.destroy
    render 'players/show'
  end

  def submit_actions
    @player.change_action_state
    render nothing: true, status: :ok, content_type: 'text/html'
  end

  def next_action
    @player.do_next_action
    render 'players/show'
  end

  def chose_selection
    if params[:search_action]
      roll = @player.perform_search(params[:search_action].downcase)
      if roll == 1
        render 'players/roll_one'
        return
      end
    else
      @player.search_choice(params[:search_choice])
    end
    render 'players/show'
  end

  def next_turn

    render 'players/show'
  end

  private
  def player_params
    params.require(:player).permit(:first_name, :last_name, :game_id, :great_treasures_vps, :usable_spells_vps, :fame_vps, :notoriety_vps, :gold_vps)
  end
  def find_player_and_action_queue
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
  end
end
