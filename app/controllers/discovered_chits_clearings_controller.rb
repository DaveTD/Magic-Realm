class DiscoveredChitsClearingsController < ApplicationController
  def index
    @discovered_chits_clearings = DiscoveredChitsClearing.where(game_id: params[:game_id])
  end

  def edit
    @discovered_chits_clearing = DiscoveredChitsClearing.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    discovered_chits_clearing = DiscoveredChitsClearing.where(game_id: params[:game_id]).where(id: params[:id]).first
    discovered_chits_clearing.update!(discovered_chits_clearing_params)
    redirect_to game_discovered_chits_clearings_path
  end

  def show
    @discovered_chits_clearing = DiscoveredChitsClearing.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    DiscoveredChitsClearing.create(discovered_chits_clearing_params)
    redirect_to game_discovered_chits_clearings_path
    #discovered_chits_clearing.save
  end

  def new
    @discovered_chits_clearing = DiscoveredChitsClearing.new
  end

  def destroy
    @discovered_chits_clearing = DiscoveredChitsClearing.where(game_id: params[:game_id]).where(id: params[:id]).first
    @discovered_chits_clearing.destroy
    redirect_to game_discovered_chits_clearings_path
  end

  private
  def discovered_chits_clearing_params
    params.require(:discovered_chits_clearing).permit(:player_id, :game_id, :clearing_id)
  end

end
