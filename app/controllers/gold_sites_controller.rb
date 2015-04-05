class GoldSitesController < ApplicationController
  def index
    @gold_sites = GoldSite.where(game_id: params[:game_id])
  end

  def edit
    @gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
    gold_site.update!(gold_site_params)
    redirect_to game_gold_sites_path
  end

  def show
    @gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    GoldSite.create(gold_site_params)
    redirect_to game_gold_sites_path
    #gold_site.save
  end

  def new
    @gold_site = GoldSite.new
  end

  def destroy
    @gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
    @gold_site.destroy
    redirect_to game_gold_sites_path
  end

  def set_default_response_format
    request.format = [:html] unless params[:format]
  end

private
  def gold_site_params
    params.require(:gold_site).permit(:game_id, :site_name, :tile_id, :tile_clearing_number, :clearing_id, :lost_city, :lost_castle)
  end
end
