object @action_queue
cache @action_queue

attributes :id, :action_name, :turn, :action_this_turn, :clearing_id, :completed

child :clearing do
  attributes :id, :x, :y, :exit, :movement_type, :tile_id
end

child(:target_clearings, :object_root => false, :if => lambda { |a| a.search? || a.move?}) do
  attributes :id, :x, :y, :exit, :movement_type, :tile_id
end

node(:can_move)   {|a| a.can_move?}
node(:can_hide)   {|a| a.can_hide?}
node(:can_search) {|a| a.can_search?}
node(:can_rest)   {|a| a.can_rest?}
