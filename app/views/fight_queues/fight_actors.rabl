collection @fight_actors

attributes :id, :player_id, :monster_id

child :player do
  attributes :name, :wounds, :fatigue
  child(:character_class) do
    attributes :name
  end
end

child :monster do
  attributes :wounds, :fatigue, :vulnerability
  node(:name) {|m| m.monster}
end
