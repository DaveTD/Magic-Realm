object @player

attributes :id, :first_name, :last_name

node(:current_action) { |p| p.current_action }

child(:clearing) {attributes :id, :x, :y, :exit, :movement_type, :tile_id}

child(:character_class) {attributes :name}

node(:notification) {|p| p.last_unseen_notificaiton}

node(:found_clearings) { @found_clearings }
