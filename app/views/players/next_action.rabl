object @player

attributes :id, :first_name, :last_name, :ready

child :clearing, :object_root => false do
  attributes :id, :x, :y, :tile_id
end

node :notifications do
  partial('notifications/notifications', :object => @notifications)
end
