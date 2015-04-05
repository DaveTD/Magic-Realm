class FoundHiddenPassagesController < ApplicationController
  def index
    @found_hidden_passages = FoundHiddenPassage.where(game_id: params[:game_id])
  end

  def edit
    @found_hidden_passage = FoundHiddenPassage.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def update
    found_hidden_passage = FoundHiddenPassage.where(game_id: params[:game_id]).where(id: params[:id]).first
    found_hidden_passage.update!(found_hidden_passage_params)
    redirect_to game_found_hidden_passages_path
  end

  def show
    @found_hidden_passage = FoundHiddenPassage.where(game_id: params[:game_id]).where(id: params[:id]).first
  end

  def create
    FoundHiddenPassage.create(found_hidden_passage_params)
    redirect_to game_found_hidden_passages_path
    #found_hidden_passage.save
  end

  def new
    @found_hidden_passage = FoundHiddenPassage.new
  end

  def destroy
    @found_hidden_passage = FoundHiddenPassage.where(game_id: params[:game_id]).where(id: params[:id]).first
    @found_hidden_passage.destroy
    redirect_to game_found_hidden_passages_path
  end

  private
  def found_hidden_passage_params
    params.require(:found_hidden_passage).permit(:player_id, :game_id, :clearing_id)
  end

end
