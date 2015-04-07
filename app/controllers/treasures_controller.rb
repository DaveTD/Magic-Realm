class TreasuresController < ApplicationController
  def index
    @treasures = Treasure.where(game_id: params[:game_id])
  end

  def edit
    @treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
    treasure.update!(treasure_params)
    redirect_to game_treasures_path
  end

  def show
    @treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    Treasure.create(treasure_params)
    redirect_to game_treasures_path
  end

  def new
    @treasure = Treasure.new
  end

  def destroy
    @treasure = Treasure.where(game_id: params[:game_id]).where(id: params[:id]).first
    @treasure.destroy
    redirect_to game_treasures_path
  end

  def inventory
    @inventory = Treasure.where(game_id: params[:game_id]).where(player_id: params[:player_id]).pluck(:name)
    render json: @inventory
  end

private
  def treasure_params
    params.require(:treasure).permit(:game_id, :name, :large, :spell_type, :fame_value, :great, :fame_price_number, :enchanted, :weight, :notoriety_value, :price, :metatreasure, :movable, :pile, :player_id)
  end

end

