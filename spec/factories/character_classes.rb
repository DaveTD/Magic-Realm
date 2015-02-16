FactoryGirl.define do
  factory :character_class do
    vunlerability 1
movement_cost 1
cave_movement_cost 1
mountain_movement_cost 1
ally nil
friendly nil
unfriendly nil
enemy nil
development_chits nil
special_advantages "MyText"
base_rest_phases ""
  end

end
