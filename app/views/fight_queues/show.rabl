object @fight_queue

attributes :id, :fight_round, :clearing_id, :state

child :fight_actors do |fa|
  attributes :player_id, :monster_id
  child :player do
    attributes :name, :wounds, :fatigue
  end
  child :monster do
    attributes :name, :vulnerability, :wounds, :fatigue
  end
end

child :fight_actions do |fa|
  attributes
end
