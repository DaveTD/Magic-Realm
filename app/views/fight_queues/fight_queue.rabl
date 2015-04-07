object @fight_queue

attributes :id, :fight_round, :clearing_id, :state

child :fight_actors do |fa|
  attributes :player_id, :monster_id
  child :player od
    attributes :name
  end
  child :monster do
    attributes :name
  end
end


