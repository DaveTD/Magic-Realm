class TreasureController < ApplicationController
  def index
    @treasures = Treasure.where(game_id: params[:game_id])
    render :template => 'treasure/index.html'
  end

  def edit
    @treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'treasure/edit.html'
  end

  def update
    treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
    treasure.update!(treasure_params)
    redirect_to game_treasure_index_path
  end

  def show
    @treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'treasure/show.html'
  end

  def create
    Treasure.create(treasure_params)
    redirect_to game_treasure_index_path
  end

  def new
    @treasure = Treasure.new
    render :template => 'treasure/new.html'
  end

  def destroy
    @treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
    @treasure.destroy
    redirect_to game_treasure_index_path
  end

private
  def treasure_params
    params.require(:treasure).permit(:game_id, :name, :large, :spell_type, :fame_value, :great, :fame_price_number, :enchanted, :weight, :notoriety_value, :price, :metatreasure, :movable, :pile)
  end

end

