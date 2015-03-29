class MonstersController < ApplicationController
  def index
    @monsters = Monster.where(game_id: params[:game_id])
    render :template => 'monsters/index.html'
  end

  def edit
    @monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'monsters/edit.html'
  end

  def update
    monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
    monster.update!(monster_params)
    redirect_to game_monster_index_path
  end

  def show
    @monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
    render :template => 'monsters/show.html'
  end

  def create
    Monster.create(monster_params)
    redirect_to game_monster_index_path
    #monster.save
  end

  def new
    @monster = Monster.new
    render :template => 'monsters/new.html'
  end

  def destroy
    @monster = Monster.where(game_id: params[:game_id]).where(id: params[:id]).first
    @monster.destroy
    redirect_to game_monster_index_path
  end

private
  def monster_params
    params.require(:monster).permit(:game_id, :monster, :damage_type, :attack_time, :maneuver_time, :vulnerability, :attacks, :clearing_id, :prowling, :blocked, :monster_name)
  end

end
