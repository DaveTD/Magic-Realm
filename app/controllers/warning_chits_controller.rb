class WarningChitsController < ApplicationController
  def index
    @warning_chits = WarningChit.where(game_id: params[:game_id])
  end

  def edit
    @warning_chit = WarningChit.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    warning_chit = WarningChit.where(game_id: params[:game_id]).where(id: params[:id]).first
    warning_chit.update!(warning_chit_params)
    redirect_to game_warning_chits_path
  end

  def show
    @warning_chit = WarningChit.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    WarningChit.create(warning_chit_params)
    redirect_to game_warning_chits_path
    #warning_chit.save
  end

  def new
    @warning_chit = WarningChit.new
  end

  def destroy
    @warning_chit = WarningChit.where(game_id: params[:game_id]).where(id: params[:id]).first
    @warning_chit.destroy
    redirect_to game_warning_chits_path
  end

private
  def warning_chit_params
    params.require(:warning_chit).permit(:game_id, :name, :tile_id, :letter)
  end

end
