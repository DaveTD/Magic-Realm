class PlayersController < ApplicationController
  before_action :find_player_and_action_queue
  skip_before_action :find_player_and_action_queue, :only => [:create, :index, :edit]

  def edit
    @player = Player.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'players/edit.html'
  end

  def index
    @players = Player.where(game_id: params[:game_id])
    render :template => 'players/index.html'
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

  def cheatmode_update
    @player = Player.find params[:id]
    @player.update!(player_params)
    redirect_to game_players_path
  end

  def show
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
    @found_clearings = []
    known_clearings = DiscoveredChitsClearing.where(player_id: params[:id]).pluck(:id, :clearing_id)
    clearing_nums = DiscoveredChitsClearing.where(player_id: params[:id]).pluck(:clearing_id)
    clearing_data = Clearing.where(id: clearing_nums)
    known_clearings.each do |c|
      @found_clearings << { :id => c.first, :clearing_id => c.last, :x => clearing_data.where(id: c.last).first.x, :y => clearing_data.where(id: c.last).first.y }
    end

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
    dice = params[:dice] == '0' ? nil : params[:dice].to_i
    @action = @player.action_queues.last
    return if @action.completed == true

    @player.do_next_action(dice)
    @notifications = @player.game.notifications.not_private.last(5)
    @aq_complete = ActionQueue.where(player_id: @player.id, completed: false).order('action_this_turn ASC').first.try(:completed)
    render 'players/next_action'
  end

  def chose_selection
    dice = params[:dice] == '0' ? nil : params[:dice].to_i
    if params[:search_action]
      roll = @player.perform_search(params[:search_action].downcase, dice)
      if roll == 1
        render 'players/roll_one'
        return
      end
    else
      @player.search_choice(params[:search_choice])
    end
    render json: @player
  end

  def end_turn
    @player.end_turn
    render json: @player
  end

  def update_block
    @player.block = params[:block]
    @player.save
    render json: @player
  end

  private
  def player_params
    params.require(:player).permit(:first_name, :last_name, :clearing_id, :game_id, :great_treasures_vps, :usable_spells_vps, :fame_vps, :notoriety_vps, :gold_vps, :ready, :fame, :gold, :notoriety, :action_queue_id, :hidden, :found_hidden_enemies, :wounds, :fatigue, :dead, :block)
  end
  def find_player_and_action_queue
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
  end
end
