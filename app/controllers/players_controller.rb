class PlayersController < ApplicationController
  before_action :find_player_and_action_queue
  skip_before_action :find_player_and_action_queue, :only => [:create]

  def edit
    @player = Player.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'player/edit.html'
  end

  def index
    @players = Player.where(game_id: params[:game_id])
    render :template => 'player/index.html'
  end

  def create
    @player = Player.new()
    @player.game_id = params[:game_id]
    @player.save
    render json: @player
  end

  def update
    @player.update_attributes(player_params)
    @player.character_class_id = params[:character_class_id]
    @player.save
    @player.game.check_votes
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

  def end_turn
    @player.end_turn
    render 'players/show'
  end

  private
  def player_params
    params.require(:player).permit(:first_name, :last_name, :game_id, :great_treasures_vps, :usable_spells_vps, :fame_vps, :notoriety_vps, :gold_vps, :ready)
  end
  def find_player_and_action_queue
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
  end
end
