object @player

attributes :id

child :clearing do
  attributes :id, :x, :y, :exit, :movement_type, :tile_id
  child :traversable_clearings, :object_root => false do
    child :traversable, :object_root => false do
      attributes :id, :x, :y, :exit, :movement_type, :tile_id
    end
  end
end
