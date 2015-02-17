class PlayersController < ApplicationController

  def show
    @player = Player.find params[:id]
    render 'player/show'
  end

  def update
  end

  def move_clearing
    @player = Player.find params[:id]
    @player.clearing_id = params[:clearing_id] if params[:clearing_id]
    @player.save
    render 'player/show'
  end
end
