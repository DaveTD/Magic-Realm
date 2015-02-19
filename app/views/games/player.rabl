object @player

attributes :id, :first_name, :last_name
child :clearing, :object_root => false do
  attributes :id, :x, :y, :tile_id
end
child :character_class do
  attributes :name
end
