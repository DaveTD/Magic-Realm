class GameController < ApplicationController

  def index
    @games = Game.all
    render 'game/index'
  end

  private
  def game_params
    params.require(:game).permit(:time_of_day)
  end
end
