class SpecialChitsController < ApplicationController
  def index
    @special_chits = SpecialChit.where(game_id: params[:game_id])
  end
end
