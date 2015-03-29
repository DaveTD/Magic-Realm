class GoldSiteController < ApplicationController
  def index
    @gold_sites = GoldSite.where(game_id: params[:game_id])
    render :template => 'gold_site/index.html'
  end

  def edit
    @gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'gold_site/edit.html'
  end

  def update
    gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
    gold_site.update!(gold_site_params)
    redirect_to game_gold_site_index_path
  end

  def show
    @gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'gold_site/show.html'
  end

  def create
    GoldSite.create(gold_site_params)
    redirect_to game_gold_site_index_path
    #gold_site.save
  end

  def new
    @gold_site = GoldSite.new
    render :template => 'gold_site/new.html'
  end

  def destroy
    @gold_site = GoldSite.where(game_id: params[:game_id]).where(id: params[:id]).first
    @gold_site.destroy
    redirect_to game_gold_site_index_path
  end

private
  def gold_site_params
    params.require(:gold_site).permit(:game_id, :name, :tile_id, :tile_clearing_number, :clearing_id, :lost_city, :lost_castle)
  end

end
