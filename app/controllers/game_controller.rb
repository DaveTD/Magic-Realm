class GameController < ApplicationController



private

  def game_params
    params.require(:game).permit(:time_of_day)
  end

end
