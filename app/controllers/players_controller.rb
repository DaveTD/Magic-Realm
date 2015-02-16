class PlayersController < ApplicationController

  def show
    @player = Player.find params[:id]
    render 'player/show'
  end

  def update
    @player = Player.find params[:id]
    @player.clearing_id = params[:clearing_id] if params[:clearing_id]
    binding.pry
    @player.save
    render 'player/show'
  end

  def move_clearing
  end
end
