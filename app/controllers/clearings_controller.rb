class ClearingsController < ApplicationController
  def index
    @clearings = Clearing.all
  end

  def edit
    @clearing = Clearing.where(id: params[:id]).first
  end

  def update
    clearing = Clearing.where(id: params[:id]).first
    clearing.update!(clearing_params)
    redirect_to game_clearings_path
  end

  def show
    @clearing = Clearing.where(id: params[:id]).first
  end

  def create
    Clearing.create(clearing_params)
    redirect_to game_clearings_path
    #clearing.save
  end

  def new
    @clearing = Clearing.new
  end

  def destroy
    @clearing = Clearing.where(id: params[:id]).first
    @clearing.destroy
    redirect_to game_clearings_path
  end

  private
  def clearing_params
    params.require(:clearing).permit(:clearing_id, :x, :y, :exit, :movement_type, :movement_value, :clearing_number, :tile)
  end

end
