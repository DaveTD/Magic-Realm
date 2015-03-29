class GamesController < ApplicationController

  def index
    @games = Game.where(time_of_day: 'select_classes')
    render 'games/index'
  end

  def create
    @game = Game.create()
    render json: @game
  end

  def show
    @game = Game.find params[:id]
    render 'games/game'
  end

  def cheat_mode
    render :template => 'games/cheat_mode.html'
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

  private
  def game_params
    params.require(:game).permit(:time_of_day, :game_day, :cards_randomized, :board_complete, :players_ready, :setup_complete, :player_actions_submitted, :activity_order_selected, :denizens_actions_completed, :combat_completed, :day_complete)
  end
end
