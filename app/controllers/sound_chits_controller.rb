class SoundChitsController < ApplicationController
  def index
    @sound_chits = SoundChit.where(game_id: params[:game_id])
  end

  def edit
    @sound_chit = SoundChit.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    sound_chit = SoundChit.where(game_id: params[:game_id]).where(id: params[:id]).first
    sound_chit.update!(sound_chit_params)
    redirect_to game_sound_chits_path
  end

  def show
    @sound_chit = SoundChit.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    SoundChit.create(sound_chit_params)
    redirect_to game_sound_chits_path
    #sound_chit.save
  end

  def new
    @sound_chit = SoundChit.new
  end

  def destroy
    @sound_chit = SoundChit.where(game_id: params[:game_id]).where(id: params[:id]).first
    @sound_chit.destroy
    redirect_to game_sound_chits_path
  end

private
  def sound_chit_params
    params.require(:sound_chit).permit(:game_id, :name, :tile_id, :tile_clearing_number, :clearing_id, :lost_city, :lost_castle)
  end

end
