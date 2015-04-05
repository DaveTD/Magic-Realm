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
    redirect_to game_monsters_path
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
    params.require(:monster).permit(:game_id, :monster, :damage_type, :attack_time, :maneuver_time, :vulnerability, :attacks, :clearing_id, :prowling, :blocked, :monster_name, :spawn_row, :hoard_appears, :lair_appears, :altar_appears, :shrine_appears, :pool_appears, :vault_appears, :cairns_appears, :statue_appears, :flutter_appears, :howl_appears, :patter_appears, :roar_appears, :slither_appears, :bones_appears, :dank_appears, :ruins_appears, :stink_appears, :smoke_appears, :m_appears, :v_appears, :w_appears, :c_appears,:fame_reward,:notoriety_reward,:fatigue,:wounds,:on_board,:dead)
  end

end

