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

  def show
    @player = Player.find params[:id]
    @action_queues = @player.action_queues
    @found_clearings = []
    known_clearings = DiscoveredChitsClearing.where(player_id: params[:id]).pluck(:id, :clearing_id)
    clearing_nums = DiscoveredChitsClearing.where(player_id: params[:id]).pluck(:clearing_id)
    clearing_data = Clearing.where(id: clearing_nums)
    known_clearings.each do |c|
      @found_clearings << { :id => c[0], :x => clearing_data.where(id: c[1]).first.x, :y => clearing_data.where(id: c[1]).first.y }
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
    # @player.do_next_action
    @notifications = @player.game.notifications.not_private.last(5)
    render 'players/next_action'
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
    render json: @player
  end

  def end_turn
    @player.end_turn
    render json: @player
  end

  def loot_clearing
    looted_item = nil
    looting_site = GoldSite.where(clearing_id: @player.clearing_id).first
    if looting_site != nil
      pile = looting_site.site_name
      large_treasures = Treasure.where(pile: pile).where(large: true)
      small_treasures = Treasure.where(pile: pile).where(large: false)
      all_treasures = []
      all_treasures << large_treasures << small_treasures
      all_treasures.flatten

      roll = Random.rand(1..6)
      looted_item = all_treasures[roll - 1]
    end
    return looted_item
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
