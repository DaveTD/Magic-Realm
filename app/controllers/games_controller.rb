class GamesController < ApplicationController
  before_action :load_game, only: [:show, :time_of_day, :current_player]

  def index
    @games = Game.where(time_of_day: 'select_classes')
    render 'games/index'
  end

  def create
    @game = Game.create()
    render json: @game
  end

  def show
    @notifications = @game.notifications.not_private.last(5)
    render 'games/game'
  end

  def current_player
    @player = Player.where(id: @game.current_players_turn).first
    @player_clearing = @player.clearing if @player
    @exclude_other_players = true
    render 'games/game'
  end

  def cheat_mode
    render :template => 'games/cheat_mode.html'
  end

  def time_of_day
    render json: [@game.time_of_day, @game.current_players_turn]
  end

  def lost_items
     @lost_city_tile = SpecialChit.where(game_id: params[:id]).where(name: 'Lost City').first.tile
     @lost_castle_tile = SpecialChit.where(game_id: params[:id]).where(name: 'Lost Castle').first.tile

     @lost_city_pile_sounds = SoundChit.where(game_id: params[:id]).where(lost_city: true)
     @lost_castle_pile_sounds = SoundChit.where(game_id: params[:id]).where(lost_castle: true)
     @lost_city_pile_treasures = GoldSite.where(game_id: params[:id]).where(lost_city: true)
     @lost_castle_pile_treasures = GoldSite.where(game_id: params[:id]).where(lost_castle: true)

     @lost_tile_sounds = SoundChit.where(game_id: params[:id]).where.not(tile_id: nil)
     @lost_tile_sites = GoldSite.where(game_id: params[:id]).where.not(tile_id: nil)

     render :template => 'games/lost_items.html'
   end

 def show_clearing_treasures
  gold_site = GoldSite.where(game_id: params[:id]).where(clearing_id: params[:clearing].to_i).first

  @treasure_names = []
  @pile_name = ""

  if gold_site
    treasure_list = Treasure.where(game_id: params[:id]).where(pile: gold_site.site_name.downcase)
    @clearing = Clearing.where(id: params[:clearing]).first
    @clearing_info = {number: @clearing.clearing_number, tile_name: @clearing.tile.name}
    @pile_name = gold_site.site_name

    treasure_list.each do |t|
      @treasure_names << t.name
    end
    render :template => 'games/treasure_list'
  else
    render json: nil
  end
end


  private
  def game_params
    params.require(:game).permit(:time_of_day, :game_day, :cards_randomized, :board_complete, :players_ready, :setup_complete, :player_actions_submitted, :activity_order_selected, :denizens_actions_completed, :combat_completed, :day_complete)
  end
  def load_game
    @game = Game.find params[:id]
  end
end
