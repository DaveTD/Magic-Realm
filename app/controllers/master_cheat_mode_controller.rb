require 'socket'

class MasterCheatModeController < ApplicationController

  def master_cheat_mode
    @games_and_players = {}
    @ip = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
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
