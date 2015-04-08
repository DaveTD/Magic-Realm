class MasterCheatModeController < ApplicationController

  def master_cheat_mode
    @games_and_players = {}
    # localhost:9000/games/game_id/players/player_id
    all_games = Game.where(complete: false)
    all_games.each do |game|
      ids = Player.where(game_id: game.id).pluck(:id)
      @games_and_players[game] = ids
    end

   # @games = Game.where(complete: false)
    render :template => 'games/master_cheat_mode.html'
  end

end
