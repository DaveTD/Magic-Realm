class GameController < ApplicationController

  def index
    @games = Game.all
    render 'game/index'
  end

  def randomize_cards

    @cards_randomized = true
  end

  private
  def game_params
    params.require(:game).permit(:time_of_day, :game_day, :cards_randomized, :board_complete, :players_ready, :setup_complete, :player_actions_submitted, :activity_order_selected, :denizens_actions_completed, :combat_completed, :day_complete)
  end
end
