class MasterCheatModeController < ApplicationController

  def master_cheat_mode
    @games = Game.where(complete: false)
    render :template => 'games/master_cheat_mode.html'
  end

end
