class SpecialChitController < ApplicationController
  def index
    @special_chits = SpecialChit.where(game_id: params[:game_id])
    render :template => 'special_chit/index.html'
  end
end
