class SpecialChitsController < ApplicationController
  def index
    @special_chits = SpecialChit.where(game_id: params[:game_id])
    render :template => 'special_chits/index.html'
  end
end
