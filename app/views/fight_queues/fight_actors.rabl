collection @fight_actors

attributes :id, :player_id, :monster_id

child :player do
  attributes :name, :wounds, :fatigue, :dead
  child(:character_class) do
    attributes :name
  end
end

child :monster do
  attributes :monster, :wounds, :fatigue, :vulnerability, :dead
  node(:name) {|m| m.url}
end
