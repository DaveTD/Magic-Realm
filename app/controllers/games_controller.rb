class GamesController < ApplicationController
  def index
    @games = Game.where(state: 'select_classes')
    render 'games/index'
  end

  def create
    @game = Game.create(state: 'select_classes')
  end

  def show
    @game = Game.find params[:id]
    render 'games/game'
  end

  private
  def game_params
    params.require(:game).permit(:time_of_day, :game_day, :cards_randomized, :board_complete, :players_ready, :setup_complete, :player_actions_submitted, :activity_order_selected, :denizens_actions_completed, :combat_completed, :day_complete)
  end
end
