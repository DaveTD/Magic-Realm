object @player

attributes :id, :first_name, :last_name, :ready

child :clearing, :object_root => false do
  attributes :id, :x, :y, :tile_id
  child :tile do
    attributes :name
  end
end

node(:action) {@action_queue}

node :notifications do
  partial('notifications/notifications', :object => @notifications)
end
