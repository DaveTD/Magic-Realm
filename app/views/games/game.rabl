object @game

attributes :id, :turn, :time_of_day, :current_players_turn, :created_at, :updated_at

child :notifications do |n|
  attributes(:id, :action, :if => lambda{|n| !n.private? })
end

child :players do
  extends "games/player"
end
