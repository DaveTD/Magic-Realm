object @game

attributes :id, :time_of_day, :created_at, :updated_at
child :players do
  extends "game/player"
end
