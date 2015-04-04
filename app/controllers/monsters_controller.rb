class MonstersController < ApplicationController
  def index
    @monsters = Monster.where(game_id: params[:game_id])
  end

  def edit
    @monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
    monster.update!(monster_params)
    redirect_to game_monsters_path
  end

  def show
    @monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    Monster.create(monster_params)
    redirect_to game_monster_index_path
    #monster.save
  end

  def new
    @monster = Monster.new
  end

  def destroy
    @monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
    @monster.destroy
    redirect_to game_monsters_path
  end

private
  def monster_params
    params.require(:monster).permit(:game_id, :monster, :damage_type, :attack_time, :maneuver_time, :vulnerability, :attacks, :clearing_id, :prowling, :blocked, :monster_name)
  end

end

