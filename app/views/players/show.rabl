object @player
cache @player

attributes :id, :first_name, :last_name

child(:clearing) {attributes :id, :x, :y, :exit, :movement_type, :tile_id}

child(:character_class) {attributes :name}

child(:game){extends "games/game"}

child(:action_queues) {extends "action_queues/index"}

node(:notifications) { |p| p.notifications.last }
