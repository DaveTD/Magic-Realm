object @game

attributes :id, :turn, :time_of_day, :current_players_turn, :created_at, :updated_at

node :notifications do
  partial('notifications/notifications', :object => @notifications)
end

node :current_player do
  if @player
    {
      id: @player.id,
      x: @player_clearing.x,
      y: @player_clearing.y
    }
  end
end

if !@exclude_other_players
  child :players do
    extends "games/player"
  end
end
