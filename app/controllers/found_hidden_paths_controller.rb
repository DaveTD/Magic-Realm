class FoundHiddenPathsController < ApplicationController
  def index
    @found_hidden_paths = FoundHiddenPath.where(game_id: params[:game_id])
  end

  def edit
    @found_hidden_path = FoundHiddenPath.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    found_hidden_path = FoundHiddenPath.where(game_id: params[:game_id]).where(id: params[:id]).first
    found_hidden_path.update!(found_hidden_path_params)
    redirect_to game_found_hidden_paths_path
  end

  def show
    @found_hidden_path = FoundHiddenPath.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    FoundHiddenPath.create(found_hidden_path_params)
    redirect_to game_found_hidden_paths_path
    #found_hidden_path.save
  end

  def new
    @found_hidden_path = FoundHiddenPath.new
  end

  def destroy
    @found_hidden_path = FoundHiddenPath.where(game_id: params[:game_id]).where(id: params[:id]).first
    @found_hidden_path.destroy
    redirect_to game_found_hidden_paths_path
  end

  private
  def found_hidden_path_params
    params.require(:found_hidden_path).permit(:player_id, :game_id, :clearing_id)
  end

end
