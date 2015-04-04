object @action_queue

attributes :id, :action_name, :action_this_turn, :clearing_id, :completed

child :clearing do
  attributes :id, :x, :y, :exit, :movement_type, :tile_id
end

child(:target_clearings, :object_root => false, :if => lambda { |a| a.search? || a.move?}) do
  attributes :id, :x, :y, :exit, :movement_type, :tile_id
end

node(:buttons) do |a|
  {
    move_b: a.can_move?,
    hide_b: a.can_hide?,
    search_b: a.can_search?,
    loot_b: a.can_loot?,
    rest_b: a.can_rest?,
    enchant_b: a.can_enchant?
  }
end

